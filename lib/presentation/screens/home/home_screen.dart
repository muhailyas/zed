import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zed/presentation/screens/login_page/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            icon: const Icon(Icons.logout)));
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
