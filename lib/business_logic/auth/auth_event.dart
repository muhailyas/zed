part of 'auth_bloc.dart';

class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final SignUp signUp;
  SignUpEvent({required this.signUp});
}

class LoginEvent extends AuthEvent {
  final Login login;
  LoginEvent({required this.login});
}

class VerifyEmailEvent extends AuthEvent {}

class GoogleSignUpEvent extends AuthEvent {}

class PasswordResetEvent extends AuthEvent {
  final String email;
  PasswordResetEvent({required this.email});
}
