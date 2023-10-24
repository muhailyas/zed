part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final AuthResults authResults;
  AuthError({required this.authResults});
}

class AuthSuccess extends AuthState {
  final AuthResults authResults;
  AuthSuccess({required this.authResults});
}

class EmailVerified extends AuthState {}

class PasswordResetSuccess extends AuthState {
  final String result;
  PasswordResetSuccess({required this.result});
}
