

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

sealed class AuthService{
  static final auth = FirebaseAuth.instance;

  static Future<bool> signIn(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user != null;
    } catch(e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static Future<bool> forgetPassword(String email)async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch(e) {
      debugPrint("ERROR forgetPassword => : $e");
      return false;
    }
  }

}