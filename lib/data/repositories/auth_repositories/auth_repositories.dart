import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/utils/constants/constants.dart';

class AuthRepository {
  static Future<UserValidation> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.reload();
    final isEmailVerified =
        FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    if (isEmailVerified) {
      return UserValidation.verified;
    } else {
      Completer<UserValidation> completer = Completer<UserValidation>();
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          timer.cancel();
          completer.complete(UserValidation.verified);
        }
      });
      return completer.future;
    }
  }

  static Future<UserValidation> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      userCredential.user!.sendEmailVerification();
      return verifyEmail();
    } catch (e) {
      log(e.toString());
      return UserValidation.error;
    }
  }

  static Future<UserValidation> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return UserValidation.loginSuccess;
    } catch (e) {
      log(e.toString());
      // error should handle error here
      return UserValidation.error;
    }
  }
}
