part of 'auth_bloc.dart';

class AuthState {
  bool isSaving;
  UserValidation? userValidation;
  AuthState({required this.isSaving, this.userValidation});
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(isSaving: false);
}
