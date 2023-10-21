import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
            child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: secondaryBlue, borderRadius: BorderRadius.circular(50)),
          child: IconButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                    (route) => false);
                await Future.delayed(const Duration(seconds: 1));
                if (getProviderForCurrentUser() == 'Google Provider') {
                  GoogleSignIn().signOut();
                }
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)),
        )),
        height20,
        IconButton(onPressed: () async {}, icon: const Icon(Icons.back_hand))
      ],
    );
  }
}

String getProviderForCurrentUser() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null && user.providerData.isNotEmpty) {
    String primaryProvider = user.providerData[0].providerId;
    if (primaryProvider == 'google.com') {
      return 'Google Provider';
    } else {
      return 'Email/Password Provider';
    }
  } else {
    return 'No associated providers';
  }
}
