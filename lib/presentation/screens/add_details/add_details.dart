import 'package:flutter/material.dart';

class AddDetailsWithSignUp extends StatelessWidget {
  const AddDetailsWithSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_rounded),
                Text("Create account")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
