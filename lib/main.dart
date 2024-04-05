import 'dart:io';

import 'package:file_upload_firebas_storage/home.dart';
import 'package:file_upload_firebas_storage/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBLoZZwag58VZXusu6OXbGNuLbPfh23LrM",
              appId: "1:70688616430:android:724235eafa1f885eec28ff",
              messagingSenderId: "70688616430",
              projectId: "file-uploading-a1625"),
        )
      : Firebase.initializeApp();
  await signInAnonymously();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
