import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/repositories/auth_repositories/auth_repositories.dart';
import 'package:zed/utils/constants/constants.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      emit(AuthState(isSaving: true, authResults: AuthResults.initial));
      AuthResults authResults = await AuthRepository.signUpWithEmail(
          email: event.email, password: event.password);
      emit(AuthState(isSaving: false, authResults: authResults));
    });
    on<Login>((event, emit) async {
      emit(AuthState(
          isSaving: true, authResults: AuthResults.initial, isLogin: true));
      AuthResults authResults = await AuthRepository.signInWithEmail(
          email: event.email, password: event.password);
      return emit(
          AuthState(isSaving: false, authResults: authResults, isLogin: true));
    });
    on<VerifyEmailEvent>((event, emit) async {
      emit(AuthState(isSaving: false, authResults: AuthResults.initial));
      AuthResults authResults = await AuthRepository.verifyEmail();
      emit(AuthState(isSaving: false, authResults: authResults));
    });
  }
}
