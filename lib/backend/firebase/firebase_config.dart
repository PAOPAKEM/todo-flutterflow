import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBwKIFaq32TJS4LIzariH89K3S6n-v6E5E",
            authDomain: "todo-kzc2fi.firebaseapp.com",
            projectId: "todo-kzc2fi",
            storageBucket: "todo-kzc2fi.appspot.com",
            messagingSenderId: "450857944659",
            appId: "1:450857944659:web:c684e780202448877ce8a6"));
  } else {
    await Firebase.initializeApp();
  }
}
