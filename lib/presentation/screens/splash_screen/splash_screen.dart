import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const RootPage(),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
          (route) => false,
        );
      }
    });
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          primaryColor,
          secondaryDark,
          primaryColor,
        ]),
      ),
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
            height10,
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}