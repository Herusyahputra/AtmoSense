import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report
import pickle
import os

# 1. Sesuaikan path dengan user 'tabumn'
CSV_PATH = "/home/tabumn/firebase/ambil_data.csv"

if not os.path.exists(CSV_PATH):
    print(f"[Error] File tidak ditemukan di: {CSV_PATH}")
    print("Silakan ganti nama file di atas sesuai dengan nama file CSV Anda yang sesuai.")
else:
    df = pd.read_csv(CSV_PATH)
    print(f"Jumlah baris: {len(df)}")
    print(f"Kolom: {df.columns.tolist()}")
    
    # 2. Definisikan Fitur dan Target
    FITUR  = ["pm1_0", "pm2_5", "pm10", "mq135", "mq7", "temperature", "humidity"]
    TARGET = "kategori_ispu"
    
    X = df[FITUR]
    y = df[TARGET]

    # Split data: 80% Train, 20% Test
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )

    # 3. Training Model Random Forest
    print("[-] Sedang melatih model...")
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)

    # 4. Evaluasi Model
    y_pred = model.predict(X_test)
    print("\n" + "=" * 40)
    print(f" Hasil Akurasi: {accuracy_score(y_test, y_pred) * 100:.2f}%")
    print("=" * 40)
    print(classification_report(y_test, y_pred))

    # 5. Simpan Model ke direktori tabumn
    MODEL_PATH = "/home/tabumn/firebase/random_forest.pkl"
    with open(MODEL_PATH, "wb") as f:
        pickle.dump(model, f)
    print(f"✔ Model berhasil disimpan → {MODEL_PATH}")
