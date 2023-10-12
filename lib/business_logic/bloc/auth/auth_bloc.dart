import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/repositories/auth_repositories.dart';
import 'package:zed/utils/constants/constants.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      emit(AuthState(isSaving: true));
      UserValidation userValidation = await AuthRepository.signUpWithEmail(
          email: event.email, password: event.password);
      return emit(AuthState(isSaving: false, userValidation: userValidation));
    });
    on<Login>((event, emit) async {
      emit(AuthState(isSaving: true));
      UserValidation userValidation = await AuthRepository.signInWithEmail(
          email: event.email, password: event.password);
      return emit(AuthState(isSaving: false, userValidation: userValidation));
    });
  }
}
