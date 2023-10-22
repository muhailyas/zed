import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/presentation/screens/home/home_screen.dart';
import 'package:zed/presentation/screens/notifications/notification_screen.dart';
import 'package:zed/presentation/screens/profile/profile_screen.dart';
import 'package:zed/presentation/screens/search/search_screen.dart';
import 'package:zed/utils/colors/colors.dart';

const testImage =
    'https://imgs.search.brave.com/8Si_AZEDfKmdc3P6BB1Yi0m831lxClEL9I77mwshNHI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMw/MzIwNjY0NC9waG90/by9wb3J0cmFpdC1v/Zi1zbWlsaW5nLWNh/dWNhc2lhbi1tYW4t/cG9zZS1pbi1vZmZp/Y2UuanBnP3M9NjEy/eDYxMiZ3PTAmaz0y/MCZjPTdscGJ4NWpF/VlFrZEcwaUE5VXZz/RVVtZXU3b2VkMkEz/c3V2TXdNUEFlSXM9';
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
    fontStyle: italic,
  );
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
SizedBox height160 = SizedBox(height: screenHeight * 0.3);
SizedBox width10 = SizedBox(width: screenWidth * 0.03);
SizedBox width20 = SizedBox(width: screenWidth * 0.06);

// constant divider
const divider = Divider(color: whiteColor);

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
  verified,
  googleSignInVerified,
  googleSignInVerifiedNewUser,
  passwordReset
}

ValueNotifier<bool> isValid = ValueNotifier(false);
ValueNotifier<bool> isObscure = ValueNotifier(true);
ValueNotifier<bool> isAvailable = ValueNotifier(false);

ValueNotifier<String> image = ValueNotifier('');

// screens
List screens = const [
  HomeScreen(),
  SearchScreen(),
  NotificationScreen(),
  ProfileScreen()
];
