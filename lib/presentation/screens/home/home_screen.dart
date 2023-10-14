import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Screen",
        style: customFontStyle(),
      ),
    );
  }
}
