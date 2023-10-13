import 'package:flutter/material.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/presentation/screens/user_name_setup/user_name_setup.dart';
import 'package:zed/utils/constants/constants.dart';

void userValidationResult(
    {required UserValidation userValidation,
    required BuildContext context,
    String? name,
    String? email}) {
  Navigator.pop(context);
  if (userValidation == UserValidation.verified) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => UserNameSetup(name: name!),
        ),
        (route) => false);
  } else if (userValidation == UserValidation.loginSuccess) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
        (route) => false);
  } else {
    print(userValidation.name);
  }
}
