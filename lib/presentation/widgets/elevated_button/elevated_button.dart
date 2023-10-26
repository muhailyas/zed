import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key,
      required this.color,
      this.prefix,
      required this.label,
      required this.onPressed,
      this.height,
      this.width,
      this.fontSize = 20,
      this.fontWeight = FontWeight.bold});
  final Color color;
  final Widget? prefix;
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: radius20)),
          fixedSize: MaterialStatePropertyAll(Size(
              width == null ? screenWidth : screenWidth * width!,
              height == null ? screenHeight * 0.05 : screenHeight * height!)),
          backgroundColor: MaterialStatePropertyAll(color)),
      icon: prefix ?? const SizedBox(),
      label: Text(
        label,
        style:
            customFontStyle(fontWeight: fontWeight, size: textSize * fontSize),
      ),
    );
  }
}
