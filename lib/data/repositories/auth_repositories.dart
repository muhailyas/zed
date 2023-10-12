import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/utils/constants/constants.dart';

class AuthRepository {
  static Future<UserValidation> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserValidation.signUpSuccess;
    } catch (e) {
      print(e);
      // error should handle error here
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
      print(e);
      // error should handle error here
      return UserValidation.error;
    }
  }
}
