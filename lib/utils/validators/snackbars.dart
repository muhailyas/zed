import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

void userValidationResult(
    {required AuthResults authResults,
    required BuildContext context,
    required AuthProvider isLogin}) {
  if (isLogin == AuthProvider.login) {
    Navigator.pop(context);
  }
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
  } else if (authResults == AuthResults.invalidEmail) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  } else if (authResults == AuthResults.wrongPassword) {
    Navigator.pop(context);
    showErrorSnackBar(authResults.name, context, Colors.red);
  } else if (authResults != AuthResults.signUpSuccess) {
    showErrorSnackBar(authResults.name, context, Colors.red);
  }
}

void showErrorSnackBar(String errorMessage, BuildContext context, Color color) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: errorMessage,
      backgroundColor: color,
    ),
  );
}
