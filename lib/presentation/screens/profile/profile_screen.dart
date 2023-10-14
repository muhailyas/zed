import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile screen",
        style: customFontStyle(),
      ),
    );
  }
}
