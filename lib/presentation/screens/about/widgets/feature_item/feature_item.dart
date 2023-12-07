import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width10,
        SizedBox(
            width: screenWidth / 1.2,
            child: Text(text, style: customFontStyle(size: 16))),
      ],
    );
  }
}
