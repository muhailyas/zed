import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class EmailVerify {
  EmailVerify._();
  static final EmailVerify instance = EmailVerify._();
  factory EmailVerify() => instance;

  final _auth = FirebaseAuth.instance;

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signUpEmailandPassword(
      {required String email, required String password}) async {
    final auth = FirebaseAuth.instance;
    try {
      final authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await authResult.user!.sendEmailVerification();
      await authResult.user?.reload();
      final isEmailVerified = authResult.user?.emailVerified ?? false;
      if (!isEmailVerified) {
        authResult.user!.delete();
      } else {
        log("Sign up verified");
      }
    } catch (e) {
      print(e);
    }
  }
}
