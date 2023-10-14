import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/utils/colors/colors.dart';

customFontStyle(
    {double size = 20,
    Color color = whiteColor,
    double letterSpacing = 0,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle italic = FontStyle.normal}) {
  return GoogleFonts.lato(
      fontSize: textSize * size,
      color: color,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      fontStyle: italic);
}

// reactive text size
double textSize = 0;

// reactive height
double screenHeight = 0;
double screenWidth = 0;
setScreenSize(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
  textSize = MediaQuery.of(context).textScaleFactor;
}

// constant heights
SizedBox height05 = SizedBox(height: screenHeight * 0.01);
SizedBox height10 = SizedBox(height: screenHeight * 0.02);
SizedBox height20 = SizedBox(height: screenHeight * 0.04);

// constant border radius

final radius10 = BorderRadius.circular(10);
final radius20 = BorderRadius.circular(20);

// constant values

enum UserValidation {
  newUser,
  currentUser,
  oldUser,
  userNotFound,
  wrongPassword,
  signUpSuccess,
  loginSuccess,
  error,
  verified,
}

enum AuthResults {
  initial,
  loginSuccess,
  signUpSuccess,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  userNotFound,
  wrongPassword,
  error,
  verified
}
// add detail

enum AddUserDetailWithSignUp {
  addImage,
}

ValueNotifier<bool> isValid = ValueNotifier(false);
