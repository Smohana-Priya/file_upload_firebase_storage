// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

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
