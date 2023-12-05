import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/splash/splash_bloc.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/utils/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(const SplashEvent.startApp());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToAuthScreen) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthScreen(),
              ));
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const RootPage()),
              (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: double.infinity),
            Text(
              'Welcome to ZED',
              style: customFontStyle(),
            ),
            const SizedBox(
                height: 200,
                width: 200,
                child: RiveAnimation.asset('assets/loading.riv'))
          ],
        ),
      ),
    );
  }
}
