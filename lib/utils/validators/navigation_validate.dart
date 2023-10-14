import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

void userValidationResult(
    {required AuthResults authResults, required BuildContext context}) {
  if (authResults == AuthResults.loginSuccess) {
    showErrorSnackBar(authResults.name, context, Colors.green);
    Navigator.pop(context);
    return;
  }

  if (authResults == AuthResults.verified) {
    showErrorSnackBar(authResults.name, context, Colors.green);
  } else if (authResults == AuthResults.loginSuccess) {
    showErrorSnackBar(authResults.name, context, Colors.green);
  } else if (authResults == AuthResults.userNotFound) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  } else if (authResults == AuthResults.invalidEmail) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  } else if (authResults == AuthResults.wrongPassword) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  } else if (authResults != AuthResults.signUpSuccess) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  }
}

void showErrorSnackBar(String errorMessage, BuildContext context, Color color) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
