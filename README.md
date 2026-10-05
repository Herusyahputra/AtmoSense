# AtmoSense

Mobile application for **real-time air quality monitoring** and **PM2.5 prediction** developed using **FlutterFlow**, **Firebase**, **IoT**, and **Machine Learning**.

---

# Features

- 📊 Real-time air quality monitoring
- 🌫️ PM1.0, PM2.5, and PM10 visualization
- 🌡️ Temperature and humidity monitoring
- ☁️ Firebase Realtime Database integration
- 🤖 PM2.5 prediction using Random Forest
- 📍 Monitoring location information
- 📱 Cross-platform mobile application (Android & iOS)

---

# Technology Stack

- FlutterFlow
- Flutter
- Firebase Realtime Database
- Firebase Authentication
- Cloud Functions
- ESP32
- PMS7003
- MQ-7
- MQ-135
- DHT22
- Python
- Scikit-learn
- Random Forest

---

# Project Structure

```
lib/
├── backend/
├── components/
├── pages/
├── flutter_flow/
└── main.dart

assets/
firebase/
android/
ios/
web/
```

---

# Application Pages

- Dashboard
- Location
- Prediction
- Device

---

# Air Quality Parameters

| Parameter | Description |
|-----------|-------------|
| PM1.0 | Fine particulate matter |
| PM2.5 | Fine particulate matter (<2.5 μm) |
| PM10 | Particulate matter (<10 μm) |
| Temperature | Ambient temperature |
| Humidity | Relative humidity |
| MQ-7 | Carbon Monoxide (CO) |
| MQ-135 | Air quality gas sensor |

---

# Machine Learning

Prediction model:

- Random Forest Regressor

Evaluation metrics:

- R² Score
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)

---

# Firebase Structure

```
sensor/
│
├── temperature
├── humidity
├── mq135
├── mq7
├── pm1
├── pm25
└── pm10
```

---

# Getting Started

## Clone Repository

```bash
git clone https://github.com/hanifabdillh/AtmoSense.git
```

---

## Install Dependencies

```bash
flutter pub get
```

---

## Run Application

```bash
flutter run
```

---

## Build Release APK

```bash
flutter build apk --release
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---


# Author

**Hanif Abdillah, Raka Naufal Dzakwan, Ahmad Rifada**

Final Year Project

Telecommunication Engineering

Telkom University
