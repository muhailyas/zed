import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/models/login/login.dart';
import 'package:zed/data/models/sign_up/sign_up.dart';
import 'package:zed/data/repositories/auth_repositories/auth_repositories.dart';
import 'package:zed/utils/constants/constants.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final signUpformKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthState(isSaving: true, authResults: AuthResults.initial));
      AuthResults authResults = await AuthRepository.signUpWithEmail(
          email: event.signUp.email, password: event.signUp.password);
      emit(AuthState(isSaving: false, authResults: authResults));
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthState(
          isSaving: true, authResults: AuthResults.initial, isLogin: true));
      AuthResults authResults = await AuthRepository.signInWithEmail(
          email: event.login.email, password: event.login.password);
      return emit(
          AuthState(isSaving: false, authResults: authResults, isLogin: true));
    });
    on<VerifyEmailEvent>((event, emit) async {
      emit(AuthState(isSaving: false, authResults: AuthResults.initial));
      AuthResults authResults = await AuthRepository.verifyEmail();
      emit(AuthState(isSaving: false, authResults: authResults));
    });
    on<GoogleSignUpEvent>((event, emit) async {
      emit(AuthState(
          isSaving: false, authResults: AuthResults.initial, isLogin: false));
      AuthResults authResults = await AuthRepository.signInWithGoogle();
      emit(AuthState(isSaving: false, authResults: authResults));
    });
    on<PasswordResetEvent>((event, emit) async {
      emit(AuthState(isSaving: true, authResults: AuthResults.passwordReset));
      final result = await AuthRepository.passwordReset(email: event.email);
      emit(AuthState(
          isSaving: false,
          authResults: AuthResults.passwordReset,
          passReset: result));
    });
  }
}
