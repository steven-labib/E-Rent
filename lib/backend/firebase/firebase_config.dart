import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDUabYMDT1MRaRJ34VqWHWL5Nq17r15fMk",
            authDomain: "e-rent-7c991.firebaseapp.com",
            projectId: "e-rent-7c991",
            storageBucket: "e-rent-7c991.firebasestorage.app",
            messagingSenderId: "352460898353",
            appId: "1:352460898353:web:83f62a0ba225e1fc26d510",
            measurementId: "G-WWB1SJ4PH4"));
  } else {
    await Firebase.initializeApp();
  }
}
