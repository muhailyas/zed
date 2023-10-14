part of 'auth_bloc.dart';

class AuthEvent {}

class SignUp extends AuthEvent {
  String email;
  String password;
  SignUp({required this.email, required this.password});
}

class Login extends AuthEvent {
  String email;
  String password;
  Login({required this.email, required this.password});
}

class VerifyEmailEvent extends AuthEvent {}
