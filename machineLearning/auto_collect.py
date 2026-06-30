import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import csv
import os
import time
from datetime import datetime

# 1. Inisialisasi Firebase (Gunakan pengondisian agar tidak bentrok)
if not firebase_admin._apps:
    cred = credentials.Certificate("serviceAccountKey.json")
    firebase_admin.initialize_app(cred, {
        'databaseURL': 'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/'
    })

CSV_FILE = "data_baru.csv"

# 2. Rumus Konversi Kategori ISPU Berdasarkan PM2.5 Asli
def pm25_to_ispu_category(pm25):
    if pm25 <= 15.5:
        return "BAIK"
    elif pm25 <= 55.4:
        return "SEDANG"
    elif pm25 <= 150.4:
        return "TIDAK SEHAT"
    elif pm25 <= 250.4:
        return "SANGAT TIDAK SEHAT"
    else:
        return "BERBAHAYA"

print("[-] Memulai pengambilan data otomatis per 5 detik...")
print("[-] Tekan Ctrl + C untuk menghentikan program.\n")

while True:
    try:
        # 3. Ambil data langsung dari node 'sensor'
        ref = db.reference('sensor')
        data_sensor = ref.get()
        
        if data_sensor:
            # 4. PENCETAKAN KEY YANG BENAR (Disesuaikan dengan Firebase Anda)
            humidity = data_sensor.get('humidity', 0)
            mq135 = data_sensor.get('mq135', 0)
            mq7 = data_sensor.get('mq7', 0)
            pm1 = data_sensor.get('pm1', 0)
            pm25 = data_sensor.get('pm25', 0)
            pm10 = data_sensor.get('pm10', 0)
            temp = data_sensor.get('temp', 0)
            
            # Hitung label ISPU dari nilai PM2.5 asli yang didapat
            label = pm25_to_ispu_category(pm25)
            
            # Ambil waktu lokal saat ini
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            
            # Tampilkan di monitor untuk memastikan data tidak 0 lagi
            print(f"[{timestamp}] ✔ Data Masuk | Temp: {temp}°C | PM2.5: {pm25} | Label: {label}")
            
            # 5. Simpan ke File CSV
            file_baru = not os.path.exists(CSV_FILE)
            with open(CSV_FILE, mode="a", newline="", encoding="utf-8") as f:
                writer = csv.writer(f)
                
                # Tulis Header jika file baru dibuat
                if file_baru:
                    writer.writerow(["timestamp", "pm1_0", "pm2_5", "pm10", "mq135", "mq7", "temperature", "humidity", "kategori_ispu"])
                
                # Tulis data sensor asli ke baris CSV
                writer.writerow([timestamp, pm1, pm25, pm10, mq135, mq7, temp, humidity, label])
                
        else:
            print("[!] Gagal mengambil data, node 'sensor' tidak ditemukan.")

    except Exception as e:
        print(f"[Error] Terjadi kendala: {e}")
        
    # Interval hit data (detik sesuai setup Anda sebelumnya)
    time.sleep(5)
