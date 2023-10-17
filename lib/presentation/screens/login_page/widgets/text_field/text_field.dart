import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/data_providers/firestore_service/username_exist.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      required this.iconData,
      this.obscureText = false,
      this.isConfirm = false,
      required this.function,
      this.available = false});

  final TextEditingController controller;
  final String hint;
  final IconData iconData;
  final bool obscureText;
  final bool isConfirm;
  final Function function;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText
          ? isConfirm
              ? true
              : isObscure.value
          : false,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'required field';
        } else if (!validation(function, value)) {
          return validationResult(function);
        }
        return null;
      },
      onChanged: (value) async {
        hint.contains('password')
            ? controller.text.length >= 8
                ? isValid.value = true
                : isValid.value = false
            : null;
        hint.contains('Username') && controller.text.isNotEmpty
            ? isAvailable.value =
                await FireStoreService.userNameExist(value.trim())
            : null;
      },
      style: customFontStyle(size: 16, color: greyColor),
      cursorColor: greyColor,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: greyColor),
          suffixIcon: available
              ? Icon(
                  !isAvailable.value
                      ? Icons.check_circle_outline_rounded
                      : CupertinoIcons.clear_circled,
                  color: isAvailable.value ? Colors.red : Colors.green,
                )
              : isConfirm
                  ? null
                  : obscureText
                      ? InkWell(
                          onTap: () {
                            isObscure.value = !isObscure.value;
                          },
                          child: IconButton(
                              onPressed: () {
                                isObscure.value = !isObscure.value;
                              },
                              icon: Icon(
                                isObscure.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                                color: secondaryBlue,
                              )),
                        )
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
