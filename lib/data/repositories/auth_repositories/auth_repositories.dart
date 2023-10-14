import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/utils/constants/constants.dart';

class AuthRepository {
  static Future<AuthResults> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.reload();
    final isEmailVerified =
        FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    if (isEmailVerified) {
      return AuthResults.verified;
    } else {
      Completer<AuthResults> completer = Completer<AuthResults>();
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          timer.cancel();
          completer.complete(AuthResults.verified);
        }
      });
      return completer.future;
    }
  }

  static Future<AuthResults> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.sendEmailVerification();
      return AuthResults.signUpSuccess;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return AuthResults.emailAlreadyExists;
        case 'invalid-email':
          return AuthResults.invalidEmail;
        case 'weak-password':
          return AuthResults.weakPassword;
        default:
          return AuthResults.error;
      }
    } catch (e) {
      return AuthResults.error;
    }
  }

  static Future<AuthResults> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthResults.loginSuccess;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return AuthResults.invalidEmail;
        case 'user-not-found':
          return AuthResults.userNotFound;
        case 'wrong-password':
          return AuthResults.wrongPassword;
        default:
          return AuthResults.error;
      }
    } catch (e) {
      return AuthResults.error;
    }
  }

  static void deleteUser() {
    FirebaseAuth.instance.currentUser!.delete();
  }
}
