import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zed/data/repositories/auth_repository/auth_repositories.dart';
part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository _authRepository;
  SplashBloc(this._authRepository) : super(const _Initial()) {
    on<_StartApp>(startApp);
  }

  FutureOr<void> startApp(event, Emitter<SplashState> emit) async {
    final response = await _authRepository.sessionHandling();
    response.fold((error) => emit(const SplashState.splashErrorState()),
        (response) {
      if (response) {
        emit(const SplashState.navigateToRootScreen());
      } else {
        emit(const SplashState.navigateToAuthScreen());
      }
    });
  }
}
