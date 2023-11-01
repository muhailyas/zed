import 'package:zed/data/models/login/login.dart';
import 'package:zed/data/models/sign_up/sign_up.dart';
import 'package:zed/utils/enums/enums.dart';

abstract class AuthRepository {
  Future<AuthResults> verifyEmail();
  Future<AuthResults> signUpWithEmail({required SignUp signUp});
  Future<AuthResults> signInWithEmail({required Login login});
  void deleteUser();
  Future<AuthResults> signInWithGoogle();
  Future<String> passwordReset({required String email});
  Future<void> sendEmailForVerification();
}
