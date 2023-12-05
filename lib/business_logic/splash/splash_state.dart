part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.navigateToAuthScreen() = NavigateToAuthScreen;
  const factory SplashState.navigateToRootScreen() = navigateToRootScreen;
  const factory SplashState.splashErrorState() = SplashErrorState;

}
