part of 'auth_bloc.dart';

class AuthState {
  bool isSaving;
  AuthResults authResults;
  bool isLogin;
  String? passReset;
  AuthState(
      {required this.isSaving,
      required this.authResults,
      this.isLogin = false,
      this.passReset});
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(isSaving: false, authResults: AuthResults.initial);
}
