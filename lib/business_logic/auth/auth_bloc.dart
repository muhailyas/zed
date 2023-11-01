import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/models/login/login.dart';
import 'package:zed/data/models/sign_up/sign_up.dart';
import 'package:zed/data/repositories/auth_repository/auth_repositories.dart';
import 'package:zed/utils/enums/enums.dart';

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
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<LoginEvent>(loginEvent);
    on<VerifyEmailEvent>(verifyEmailEvent);
    on<GoogleSignUpEvent>(googleSignUpEvent);
    on<PasswordResetEvent>(passwordResetEvent);
  }

  FutureOr<void> signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    AuthResults authResults =
        await authRepository.signUpWithEmail(signUp: event.signUp);
    authResults == AuthResults.signUpSuccess
        ? emit(AuthSuccess(authResults: authResults))
        : emit(AuthError(authResults: authResults));
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    AuthResults authResults =
        await authRepository.signInWithEmail(login: event.login);
    authResults == AuthResults.loginSuccess
        ? emit(AuthSuccess(authResults: authResults))
        : emit(AuthError(authResults: authResults));
  }

  FutureOr<void> verifyEmailEvent(
      VerifyEmailEvent event, Emitter<AuthState> emit) async {
    AuthResults authResults = await authRepository.verifyEmail();
    if (authResults == AuthResults.verified) {
      emit(EmailVerified());
    }
  }

  FutureOr<void> googleSignUpEvent(
      GoogleSignUpEvent event, Emitter<AuthState> emit) async {
    AuthResults authResults = await authRepository.signInWithGoogle();
    authResults == AuthResults.googleSignInVerified ||
            authResults == AuthResults.googleSignInVerifiedNewUser
        ? emit(AuthSuccess(authResults: authResults))
        : emit(AuthError(authResults: authResults));
  }

  FutureOr<void> passwordResetEvent(
      PasswordResetEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepository.passwordReset(email: event.email);
    emit(PasswordResetSuccess(result: result));
  }
}
