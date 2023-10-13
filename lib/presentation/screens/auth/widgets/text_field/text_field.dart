import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      required this.iconData,
      this.obscureText = false,
      this.isConfirm = false});

  final TextEditingController controller;
  final String hint;
  final IconData iconData;
  final bool obscureText;
  final bool isConfirm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hint is required';
        }
        return null;
      },
      style: customFontStyle(size: 16, color: greyColor),
      cursorColor: greyColor,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: greyColor),
          suffixIcon: obscureText
              ? isConfirm
                  ? null
                  : const Icon(Icons.visibility_off, color: greyColor)
              : null,
          hintText: hint,
          hintStyle: const TextStyle(color: greyColor),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: greyColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: greyColor))),
    );
  }
}
