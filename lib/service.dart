// ignore_for_file: avoid_print

// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_picker/gallery_picker.dart';

final firebaseInstance = FirebaseAuth.instance;

Future<void> signInAnonymously() async {
  try {
    final userCredential = await firebaseInstance.signInAnonymously();
    print(
        'Sign in with temporary account UID: --> ${userCredential.user?.uid}');
  } catch (e) {
    print(e);
  }
}

// Future<File?> getImgFromGallery(BuildContext context) async {
//   try {
//     print('inside the try block');
//     List<MediaFile>? singleMedia =
//         await GalleryPicker.pickMedia(context: context, singleMedia: true);
//     print('Single media $singleMedia');
//     print(
//         'Inside the getImgfrom galley function ${singleMedia?.first.getFile()}');
//     return singleMedia?.first.getFile();
//   } catch (e) {
//     print('Inside the get img from galley catch block $e');
//     print(e);
//   }
// }

// Future<bool> uploadFile(File file) async {
//   try {s
//     final userId = firebaseInstance.currentUser?.uid;
//     final storageRef = FirebaseStorage.instance.ref();
//     final fileName = file.path.split('/').last;
//     final timeStamp = DateTime.now().microsecondsSinceEpoch;
//     final uploadRef = storageRef.child('$userId/uploads/$timeStamp-$fileName');
//     await uploadRef.putFile(file);
//     return true;
//   } catch (e) {  j
//     print('insid the catch---$e');
//     print(e);
//   }
//   return false;
// }
