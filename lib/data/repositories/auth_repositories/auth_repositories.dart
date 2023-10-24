import 'package:zed/utils/constants/constants.dart';

abstract class AuthRepository {
  Future<AuthResults> verifyEmail();

  Future<AuthResults> signUpWithEmail(
      {required String email, required String password});
      
  Future<AuthResults> signInWithEmail(
      {required String email, required String password});
  void deleteUser();
  Future<AuthResults> signInWithGoogle();
  Future<String> passwordReset({required String email});
  Future<void> sendEmailForVerification();
}
