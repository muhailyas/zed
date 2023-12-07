import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class JoinReasonItem extends StatelessWidget {
  final String text;

  const JoinReasonItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.05),
      child: Row(
        children: [
          const Icon(Icons.check, size: 20, color: Colors.green),
          width10,
          SizedBox(
              width: screenWidth / 1.3,
              child: Text(text, style: customFontStyle(size: 16))),
        ],
      ),
    );
  }
}
