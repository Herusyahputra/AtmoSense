import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import joblib
import pandas as pd
import time
from datetime import datetime

# ==============================================================================
# 1. INISIALISASI FIREBASE & MODEL
# ==============================================================================
cred = credentials.Certificate("serviceAccountKey.json") 
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/'
})

NAMA_FILE_MODEL = "model_rf.pkl" 
model = joblib.load(NAMA_FILE_MODEL)

# ==============================================================================
# 2. PENGATURAN LOGIKA PREDIKSI MASA DEPAN (UPDATED)
# ==============================================================================
INTERVAL_DETIK = 10          # Cek data setiap 10 detik
JUMLAH_SAMPLE = 60             # Ditingkat dari 5 sampel menjadi 15 (Window 15 menit)
                            # Lebih banyak data = Tren lebih stabil = Prediksi lebih yakin
MENIT_KE_DEPAN = 60           # Target prediksi 1 jam ke depan

# List untuk menyimpan history data sementara
history_sensor = []
FITUR_KOLOM = ['pm1_0', 'pm2_5', 'pm10', 'mq135', 'mq7', 'temperature', 'humidity']
FITUR_FIREBASE = ['pm1', 'pm25', 'pm10', 'mq135', 'mq7', 'temp', 'humidity']

print("=" * 60)
print(" SISTEM PREDIKSI ISPU 1 JAM KE DEPAN")
print(f" Node Realtime     : /sensor")
print(f" Node Prediksi     : /predict")
print(f" Window Data Historis : {JUMLAH_SAMPLE} sampel ({JUMLAH_SAMPLE * (INTERVAL_DETIK/60):.1f} menit)")
print("=" * 60)

# ==============================================================================
# 3. LOOP PREDIKSI
# ==============================================================================
try:
    while True:
        # Baca data realtime dari node '/sensor'
        data = db.reference("sensor").get()

        if data:
            # Ambil data saat ini dan simpan ke history
            data_saati_ini = [data.get(k, 0) for k in FITUR_FIREBASE]
            history_sensor.append(data_saati_ini)
            
            waktu_sekarang = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            # Print indikator buffer
            if (waktu_sekarang.split(":")[1] == "00"):
                print(f"[{waktu_sekarang}] Buffer: {len(history_sensor)} sampel...")

            # Jika data yang terkumpul sudah cukup untuk hitung tren
            if len(history_sensor) > JUMLAH_SAMPLE:
                history_sensor.pop(0) # Buang data paling lama agar list tidak terlalu panjang

            if len(history_sensor) == JUMLAH_SAMPLE:
                print("-" * 50)
                # 1. Hitung Kecepatan Perubahan per Menit (Rate of Change)
                data_pertama = history_sensor[0]
                data_terakhir = history_sensor[-1]
                
                total_waktu_menit = (JUMLAH_SAMPLE - 1) * (INTERVAL_DETIK / 60)
                
                # Cegah pembagian nol
                if total_waktu_menit == 0:
                    print("[WARN] Waktu kalkulasi 0, melewati prediksi.")
                else:
                    tren_per_menit = [(terakhir - pertama) / total_waktu_menit for pertama, terakhir in zip(data_pertama, data_terakhir)]

                    # 2. Proyeksikan data 1 jam ke depan
                    # Rumus: Nilai Sekarang + (Kecepatan per menit * 60 menit)
                    prediksi_1jam = [max(0, sekarang + (tren * MENIT_KE_DEPAN)) for sekarang, tren in zip(data_terakhir, tren_per_menit)]

                    # 3. Susun menjadi DataFrame untuk dimasukkan ke AI
                    df_masa_depan = pd.DataFrame([prediksi_1jam], columns=FITUR_KOLOM)

                    # 4. PREDIKSI MENGGUNAKAN MODEL
                    hasil_prediksi = model.predict(df_masa_depan)[0]
                    proba = model.predict_proba(df_masa_depan).max() * 100

                    # 5. TAMPILKAN HASIL DI TERMINAL
                    print(f" Kondisi SAAT INI : PM2.5 = {data_terakhir[1]:.1f}")
                    print(f" Proyeksi 1 JAM   : PM2.5 = {prediksi_1jam[1]:.1f}")
                    
                    # Cek prediksi 0
                    if prediksi_1jam[1] == 0:
                        print(f"  (Catatan: Udara diprediksi menjadi bersih)")
                    
                    # Tentukan Arah Tren Text
                    if tren_per_menit[1] > 0.1:
                        status_tren = "Naik"
                    elif tren_per_menit[1] < -0.1:
                        status_tren = "Turun"
                    else:
                        status_tren = "Stabil"
                    print(f" Tren PM2.5      : {status_tren}")
                    
                    print("=" * 50)
                    print(f" PREDIKSI 1 JAM KE DEPAN : {hasil_prediksi.upper()}")
                    print(f" KEYAKINAN AI             : {proba:.2f}%")
                    print("=" * 50)
                    
                    # 6. KIRIM HASIL PREDIKSI KE FIREBASE (NODE BARU)
                    # Simpan ke node '/predict' agar tidak menimpa '/sensor'
                    payload_prediksi = {
                        "waktu_prediksi": waktu_sekarang,
                        "pm2_5_saat_ini": round(data_terakhir[1], 2),
                        "pm2_5_proyeksi": round(prediksi_1jam[1], 2),
                        "tren_status": status_tren,
                        "kategori_prediksi": hasil_prediksi.upper(),
                        "confidence": round(proba, 2),
                        "timestamp": waktu_sekarang
                    }

                    # Upload ke 'latest' (selalu update data terbaru)
                    db.reference("/predict/latest").set(payload_prediksi)
                    
                    # Upload ke 'history' (menyimpan riwayat prediksi)
                    tanggal = datetime.now().strftime("%Y-%m-%d")
                    waktu   = datetime.now().strftime("%H:%M:%S")
                    db.reference(f"/predict/history/{tanggal}/{waktu}").set(payload_prediksi)

                    print(f"  ✔ Hasil dikirim ke Firebase: /predict/latest")

        else:
            print("Menunggu data dari node /sensor...")

        time.sleep(INTERVAL_DETIK)

except KeyboardInterrupt:
    print("\nProgram dihentikan oleh pengguna.")
