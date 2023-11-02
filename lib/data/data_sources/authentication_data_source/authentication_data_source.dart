import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zed/data/data_sources/firestore_service/username_exist.dart';
import 'package:zed/data/models/login/login.dart';
import 'package:zed/data/models/sign_up/sign_up.dart';
import 'package:zed/data/repositories/auth_repository/auth_repositories.dart';
import 'package:zed/utils/enums/enums.dart';

class AuthenticationDataSource implements AuthRepository {
  @override
  Future<AuthResults> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.reload();
    final isEmailVerified =
        FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    if (isEmailVerified) {
      return AuthResults.verified;
    } else {
      Completer<AuthResults> completer = Completer<AuthResults>();
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        if (FirebaseAuth.instance.currentUser == null) {
          timer.cancel();
          completer.complete(AuthResults.error);
        }
        await FirebaseAuth.instance.currentUser!.reload();
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          timer.cancel();
          completer.complete(AuthResults.verified);
        }
      });
      
      return completer.future;
    }
  }

  @override
  Future<AuthResults> signUpWithEmail({required SignUp signUp}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUp.email, password: signUp.password);
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

  @override
  Future<AuthResults> signInWithEmail({required Login login}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login.email, password: login.password);
      return AuthResults.loginSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return AuthResults.userNotFound;
      } else if (e.code == 'wrong-password') {
        return AuthResults.wrongPassword;
      } else {
        return AuthResults.error;
      }
    } catch (e) {
      return AuthResults.error;
    }
  }

  @override
  void deleteUser() {
    FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<AuthResults> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      final exist = await FireStoreService.userIdExist();
      if (exist) {
        return AuthResults.googleSignInVerified;
      }
      return AuthResults.googleSignInVerifiedNewUser;
    } catch (e) {
      return AuthResults.error;
    }
  }

  // password reset

  @override
  Future<String> passwordReset({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return 'Password reset link sent! Check your email';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  @override
  Future<void> sendEmailForVerification() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.currentUser!.sendEmailVerification();
    } catch (e) {
      log(e.toString());
    }
  }
}
