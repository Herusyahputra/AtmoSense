import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import csv
import os
import time
from datetime import datetime, timedelta
import joblib
import pandas as pd

# ==============================================================================
# 1. INISIALISASI FIREBASE
# ==============================================================================
if not firebase_admin._apps:
    cred = credentials.Certificate("serviceAccountKey.json")
    firebase_admin.initialize_app(cred, {
        'databaseURL': 'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/'
    })

# Muat Model Random Forest jika ada
NAMA_FILE_MODEL = "model_rf.pkl"
if not os.path.exists(NAMA_FILE_MODEL) and os.path.exists("model_rf.pkl"):
    NAMA_FILE_MODEL = "model_rf.pkl"

try:
    model = joblib.load(NAMA_FILE_MODEL)
    print(f"[+] Model {NAMA_FILE_MODEL} berhasil dimuat.")
except:
    model = None
    print("[Warning] Model Machine Learning tidak ditemukan, menggunakan rumus matematika linear Permen LHK.")

CSV_FILE = "data_sensor_ispu.csv"

print("[-] Loop Perhitungan ISPU Realtime (Permen LHK) Dimulai...")
print("[-] Pastikan unit MQ7 (PPM) dan MQ135 (PPB) sudah benar!")
print(f"[-] Hasil dicadangkan ke lokal: {CSV_FILE}")
print("[-] Tekan Ctrl + C untuk menghentikan.\n")

# ==============================================================================
# LOGIKA ISPU (STANDAR PERMEN LHK NO. 14 TAHUN 2020)
# ==============================================================================
# Nilai batas konsentrasi disesuaikan dengan lampiran peraturan nasional Indonesia
BREAKPOINTS_ISPU = {
    "pm25": [
        (0.0, 15.5, 0, 50),
        (15.6, 55.4, 51, 100),
        (55.5, 150.4, 101, 200),
        (150.5, 250.4, 201, 300),
        (250.5, 500.0, 301, 500)
    ],
    "co": [
        (0.0, 4.4, 0, 50),
        (4.5, 9.4, 51, 100),
        (9.5, 15.4, 101, 200),
        (15.5, 30.4, 201, 300),
        (30.5, 45.0, 301, 500)
    ],
    "no2": [
        (0, 80, 0, 50),
        (81, 200, 51, 100),
        (201, 565, 101, 200),
        (566, 1130, 201, 300),
        (1131, 2260, 301, 500)
    ]
}

def calculate_linear_ispu(concentration, pollutant_type):
    bp = BREAKPOINTS_ISPU[pollutant_type]
    c = concentration
    
    for clo, chi, ilo, ihi in bp:
        if clo <= c <= chi:
            ispu = ((ihi - ilo) / (chi - clo)) * (c - clo) + ilo
            return round(ispu)
    
    # Ekstrapolasi jika melebihi batas atas tabel peraturan
    last_bp = bp[-1]
    prev_bp = bp[-2] 
    if c > last_bp[1]:
        ispu = ((last_bp[3] - prev_bp[3]) / (last_bp[1] - prev_bp[0])) * (c - last_bp[1]) + last_bp[3]
        return round(ispu)
    
    return round(c)

def get_ispu_color(ispu):
    if ispu <= 50: return "#00e400"    # Hijau (Baik)
    elif ispu <= 100: return "#0000ff"  # Biru (Sedang)
    elif ispu <= 200: return "#ffff00"  # Kuning (Tidak Sehat)
    elif ispu <= 300: return "#ff0000"  # Merah (Sangat Tidak Sehat)
    else: return "#000000"              # Hitam (Berbahaya)

def get_ispu_category_name(ispu):
    if ispu <= 50: return "BAIK"
    elif ispu <= 100: return "SEDANG"
    elif ispu <= 200: return "TIDAK SEHAT"
    elif ispu <= 300: return "SANGAT TIDAK SEHAT"
    else: return "BERBAHAYA"

# Buffer list untuk menyimpan histori sampel demi kalkulasi tren proyeksi PM2.5
pm25_history = []

# ==============================================================================
# LOOP UTAMA
# ==============================================================================
while True:
    try:
        ref = db.reference('sensor')
        data_sensor = ref.get()
        
        if data_sensor:
            # --- 1. AMBIL DATA DARI FIREBASE ---
            pm25   = float(data_sensor.get('pm25', 0))
            mq7    = float(data_sensor.get('mq7', 0))   # CO dalam PPM
            mq135  = float(data_sensor.get('mq135', 0))  # NO2 dalam PPB
            temp   = float(data_sensor.get('temp', 0))
            hum    = float(data_sensor.get('humidity', 0))
            pm1    = float(data_sensor.get('pm1', 0))
            pm10   = float(data_sensor.get('pm10', 0))
            
            waktu_obj = datetime.now()
            timestamp = waktu_obj.strftime('%Y-%m-%d %H:%M:%S')

            if pm25 > 0 or mq7 > 0:
                
                # --- 2. HITUNG NILAI ISPU RIIL (PER POLUTAN) ---
                ispu_pm25 = calculate_linear_ispu(pm25, "pm25")
                ispu_co   = calculate_linear_ispu(mq7, "co")
                ispu_no2  = calculate_linear_ispu(mq135, "no2")

                # Ambil nilai ISPU tertinggi sebagai representasi kondisi saat ini (Metode Bottleneck)
                ispu_final = max(ispu_pm25, ispu_co, ispu_no2)
                kategori_ispu = get_ispu_category_name(ispu_final)
                warna_ispu = get_ispu_color(ispu_final)

                # --- 3. HITUNG ESTIMASI PROYEKSI TREN PM2.5 (1 JAM KE DEPAN) ---
                pm25_history.append(pm25)
                if len(pm25_history) > 60:
                    pm25_history.pop(0)

                pm25_proyeksi = pm25 
                ispu_pm25_proyeksi = ispu_pm25

                if len(pm25_history) >= 2:
                    x = list(range(len(pm25_history)))
                    mean_x = sum(x) / len(x)
                    mean_y = sum(pm25_history) / len(pm25_history)
                    
                    num = sum((x[i] - mean_x) * (pm25_history[i] - mean_y) for i in range(len(pm25_history)))
                    den = sum((x[i] - mean_x) ** 2 for i in range(len(x)))
                    
                    slope = num / den if den != 0 else 0
                    # Proyeksi ke depan (720 langkah dari interval perulangan 5 detik)
                    pm25_proyeksi = max(0.0, pm25 + (slope * 720))
                    ispu_pm25_proyeksi = calculate_linear_ispu(pm25_proyeksi, "pm25")

                target_proyeksi_waktu = (waktu_obj + timedelta(hours=1)).strftime('%Y-%m-%d %H:%M:%S')

                # --- 4. UNGHAH DATA KE FIREBASE (Node /realtime_ispu) ---
                payload = {
                    "timestamp": timestamp,
                    "target_waktu_proyeksi": target_proyeksi_waktu,
                    "ispu_final": ispu_final,
                    "kategori": kategori_ispu,
                    "warna_hex": warna_ispu,
                    "pollutans": {
                        "pm1": pm1,
                        "pm25": pm25,
                        "pm25_proyeksi_1jam": round(pm25_proyeksi, 2),
                        "pm10": pm10,
                        "co_ppm": mq7,   
                        "no2_ppb": mq135,
                        "temperature": temp,
                        "humidity": hum
                    },
                    "ispu_breakdown": {
                        "pm25_ispu": ispu_pm25,
                        "pm25_ispu_proyeksi_1jam": ispu_pm25_proyeksi,
                        "co_ispu": ispu_co,
                        "no2_ispu": ispu_no2
                    }
                }
                
                db.reference("/realtime_aqi").set(payload)
                
                # MONITOR OUTPUT TERMINAL
                print(f"[{timestamp}] ISPU RIIL (KLHK): {ispu_final} ({kategori_ispu})")
                print(f"    -> PM2.5 Saat Ini: {pm25} µg/m³ | Proyeksi PM2.5 (1 Jam): {round(pm25_proyeksi, 2)} µg/m³")
                print(f"    -> Estimasi ISPU PM2.5 Masa Depan: {ispu_pm25_proyeksi}")

                # --- 5. TULIS PENYIMPANAN LOG KE CSV LOKAL ---
                file_baru = not os.path.exists(CSV_FILE)
                with open(CSV_FILE, mode="a", newline="", encoding="utf-8") as f:
                    writer = csv.writer(f)
                    if file_baru:
                        writer.writerow([
                            "timestamp", "target_waktu_proyeksi", "pm1_0", "pm2_5", "pm2_5_proyeksi_1jam",
                            "pm10", "mq135", "mq7", "temperature", "humidity", "ispu_final", "kategori_ispu"
                        ])
                    writer.writerow([
                        timestamp, target_proyeksi_waktu, pm1, pm25, round(pm25_proyeksi, 2),
                        pm10, mq135, mq7, temp, hum, ispu_final, kategori_ispu
                    ])
                print("    ✔ Baris data tersimpan ke CSV lokal.")
                print("-" * 60)
            else:
                print(f"[{timestamp}] Data sensor 0 atau tidak valid, menunggu pembaruan...")

    except Exception as e:
        print(f"[Error] Terjadi kesalahan sistem: {e}")
        
    time.sleep(5)
