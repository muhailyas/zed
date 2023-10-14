import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Notification Screen",
        style: customFontStyle(),
      ),
    );
  }
}
