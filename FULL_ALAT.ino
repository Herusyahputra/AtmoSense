#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include <DHT.h>
#include <PMS.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

//==================================================
// LCD
//==================================================

LiquidCrystal_I2C lcd(0x27, 16, 2);

//==================================================
// WIFI
//==================================================

#define WIFI_SSID "Hanskuy"
#define WIFI_PASSWORD "hanif2004"

//==================================================
// FIREBASE
//==================================================

#define API_KEY "AIzaSyDFg7hA8T2tOTtGzS465AqORkzKwLBVh-A"

#define DATABASE_URL "https://air-quality-iot-cea00-default-rtdb.asia-southeast1.firebasedatabase.app/"

//==================================================
// DHT22
//==================================================

#define DHTPIN 4
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);

//==================================================
// MQ SENSOR
//==================================================

#define MQ135_PIN 32
#define MQ7_PIN 33

//==================================================
// PMS7003
//==================================================

#define PMS_RX 16
#define PMS_TX 17

HardwareSerial pmsSerial(2);

PMS pms(pmsSerial);
PMS::DATA data;

//==================================================
// FIREBASE OBJECT
//==================================================

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

bool signupOK = false;

//==================================================
// TIMER
//==================================================

unsigned long lastFirebase = 0;
unsigned long lastSerial = 0;
unsigned long lastLCD = 0;

int lcdPage = 0;

//==================================================
// GLOBAL SENSOR
//==================================================

float temperature = 0;
float humidity = 0;

int mq135 = 0;
int mq7 = 0;

float mq135ppm = 0;
float mq7ppm = 0;

float mq135ppmRounded = 0;
float mq7ppmRounded = 0;

const float VCC = 3.33;

const float RL135 = 2200.0;
const float RL7 = 3300.0;

const float RO135 = 300.0;
const float RO7 = 60.0;

int pm1 = 0;
int pm25 = 0;
int pm10 = 0;

//==================================================
// FILTER MQ
//==================================================

int readMQ(int pin) {

  long total = 0;

  for (int i = 0; i < 10; i++) {

    total += analogRead(pin);

    delay(10);
  }

  return total / 10;
}

//==================================================
// SETUP
//==================================================

void setup() {

  Serial.begin(9600);

  Serial.println();
  Serial.println("AIR QUALITY SYSTEM START");

  //==================================================
  // LCD
  //==================================================

  Wire.begin(21, 22);

  lcd.init();

  lcd.backlight();

  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("TA BUMN");

  lcd.setCursor(0, 1);
  lcd.print("START SYSTEM");

  delay(3000);

  //==================================================
  // DHT
  //==================================================

  dht.begin();

  //==================================================
  // ADC
  //==================================================

  analogReadResolution(12);

  //==================================================
  // PMS7003
  //==================================================

  pmsSerial.begin(
    9600,
    SERIAL_8N1,
    PMS_RX,
    PMS_TX
  );

  //==================================================
  // WIFI
  //==================================================

  WiFi.begin(
    WIFI_SSID,
    WIFI_PASSWORD
  );

  Serial.print("CONNECT WIFI");

  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("CONNECT WIFI");

  while (WiFi.status() != WL_CONNECTED) {

    Serial.print(".");

    delay(500);
  }

  Serial.println();
  Serial.println("WIFI CONNECTED");

  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("WIFI CONNECTED");

  delay(2000);

  //==================================================
  // FIREBASE
  //==================================================

  config.api_key = API_KEY;

  config.database_url = DATABASE_URL;

  if (Firebase.signUp(&config, &auth, "", "")) {

    signupOK = true;

    Serial.println("FIREBASE OK");

    lcd.clear();

    lcd.setCursor(0, 0);
    lcd.print("FIREBASE OK");

  } else {

    lcd.clear();

    lcd.setCursor(0, 0);
    lcd.print("FIREBASE FAIL");
  }

  Firebase.begin(&config, &auth);

  Firebase.reconnectWiFi(true);

  delay(2000);

  //==================================================
  // READY
  //==================================================

  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("SYSTEM READY");

  delay(2000);
}

//==================================================
// LOOP
//==================================================

void loop() {

  //==================================================
  // DHT
  //==================================================

  temperature = dht.readTemperature();

  humidity = dht.readHumidity();

  //==================================================
  // PERHITUNGAN MQ
  //==================================================

  mq135 = readMQ(MQ135_PIN);
  mq7 = readMQ(MQ7_PIN);

  // MQ135
  float voltage135 = mq135 * (VCC / 4095.0);

  float Rs135 =
  ((VCC - voltage135) / voltage135)
  * RL135;

  float ratio135 = Rs135 / RO135;

  mq135ppm =
  116.6020682 *
  pow(ratio135, -2.769034857);

  mq135ppmRounded =
  round(mq135ppm * 100.0) / 100.0;

  // MQ7
  float voltage7 = mq7 * (VCC / 4095.0);

  float Rs7 =
  ((VCC - voltage7) / voltage7)
  * RL7;

  float ratio7 = Rs7 / RO7;

  mq7ppm =
  99.042 *
  pow(ratio7, -1.518);

  mq7ppmRounded =
  round(mq7ppm * 100.0) / 100.0;

  //==================================================
  // PMS
  //==================================================

  if (pms.readUntil(data)) {

    pm1 = data.PM_AE_UG_1_0;

    pm25 = data.PM_AE_UG_2_5;

    pm10 = data.PM_AE_UG_10_0;
  }

  //==================================================
  // SERIAL MONITOR
  //==================================================

  if (millis() - lastSerial > 2000) {

    lastSerial = millis();

    Serial.println("\n===== DATA SENSOR =====");

    Serial.print("Suhu : ");
    Serial.print(temperature);
    Serial.println(" C");

    Serial.print("Kelembapan : ");
    Serial.print(humidity);
    Serial.println(" %");

    Serial.print("MQ135 ADC : ");
    Serial.println(mq135);

    Serial.print("MQ135 PPM : ");
    Serial.println(mq135ppmRounded, 2);

    Serial.print("MQ7 ADC : ");
    Serial.println(mq7ppmRounded, 2);

    Serial.print("MQ7 PPM : ");
    Serial.println(mq7ppm);

    Serial.print("PM1.0 : ");
    Serial.print(pm1);
    Serial.println(" ug/m3");

    Serial.print("PM2.5 : ");
    Serial.print(pm25);
    Serial.println(" ug/m3");

    Serial.print("PM10 : ");
    Serial.print(pm10);
    Serial.println(" ug/m3");
  }

//==================================================
// LCD DISPLAY
//==================================================

if (millis() - lastLCD > 3000) {

  lastLCD = millis();

  lcd.clear();

  //==================================================
  // PAGE 1
  // TEMPERATURE & HUMIDITY
  //==================================================

  if (lcdPage == 0) {

    lcd.setCursor(0, 0);
    lcd.print("TEMP:");
    lcd.print(temperature, 1);
    lcd.print("C");

    lcd.setCursor(0, 1);
    lcd.print("HUM :");
    lcd.print(humidity, 1);
    lcd.print("%");

    lcdPage = 1;
  }

  //==================================================
  // PAGE 2
  // MQ135 & MQ7
  //==================================================

  else if (lcdPage == 1) {

    lcd.setCursor(0, 0);
    lcd.print("135:");
    lcd.print(mq135ppm, 0);
    lcd.print("ppm");

    lcd.setCursor(0, 1);
    lcd.print("MQ7:");
    lcd.print(mq7ppm, 0);
    lcd.print("ppm");

    lcdPage = 2;
  }

  //==================================================
  // PAGE 3
  // PMS7003
  //==================================================

  else if (lcdPage == 2) {

    lcd.setCursor(0, 0);
    lcd.print("PM1:");
    lcd.print(pm1);

    lcd.print(" P25:");
    lcd.print(pm25);

    lcd.setCursor(0, 1);
    lcd.print("PM10:");
    lcd.print(pm10);

    lcdPage = 0;
  }
}

  //==================================================
  // FIREBASE
  //==================================================

  if (
    Firebase.ready()
    &&
    signupOK
    &&
    millis() - lastFirebase > 5000
  ) {

    lastFirebase = millis();

    Firebase.RTDB.setFloat(
      &fbdo,
      "/sensor/temp",
      temperature
    );

    Firebase.RTDB.setFloat(
      &fbdo,
      "/sensor/humidity",
      humidity
    );

    Firebase.RTDB.setFloat(
      &fbdo,
      "/sensor/mq135",
      mq135ppmRounded
    );

    Firebase.RTDB.setFloat(
      &fbdo,
      "/sensor/mq7",
      mq7ppmRounded
    );

    Firebase.RTDB.setInt(
      &fbdo,
      "/sensor/pm1",
      pm1
    );

    Firebase.RTDB.setInt(
      &fbdo,
      "/sensor/pm25",
      pm25
    );

    Firebase.RTDB.setInt(
      &fbdo,
      "/sensor/pm10",
      pm10
    );

    Serial.println("UPLOAD FIREBASE OK");
  }

  delay(200);
}