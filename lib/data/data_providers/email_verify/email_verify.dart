import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class EmailVerify {
  EmailVerify._();
  static final EmailVerify instance = EmailVerify._();
  factory EmailVerify() => instance;

  final _auth = FirebaseAuth.instance;

  Future<void> sendEmailForVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      log(e.toString());
    }
  }
}
