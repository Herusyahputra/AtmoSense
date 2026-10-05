import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDFg7hA8T2tOTtGzS465AqORkzKwLBVh-A",
            authDomain: "air-quality-iot-cea00.firebaseapp.com",
            projectId: "air-quality-iot-cea00",
            storageBucket: "air-quality-iot-cea00.firebasestorage.app",
            messagingSenderId: "454195797521",
            appId: "1:454195797521:web:fa609b97deceb56872dbb0",
            measurementId: "G-ST3P669RHK"));
  } else {
    await Firebase.initializeApp();
  }
}
