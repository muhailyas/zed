import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/presentation/screens/home/home_screen.dart';
import 'package:zed/presentation/screens/notifications/notification_screen.dart';
import 'package:zed/presentation/screens/profile/profile_screen.dart';
import 'package:zed/presentation/screens/search/search_screen.dart';
import 'package:zed/utils/colors/colors.dart';

const defaultProfileImage =
    "https://imgs.search.brave.com/GrTMprW4fg05XTsfzacsNofnbaMJuXlbLIXZqUAn9vg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAwLzY0LzY3LzI3/LzM2MF9GXzY0Njcy/NzM2X1U1a3BkR3M5/a2VVbGw4Q1JRM3Az/WWFFdjJNNnFrVlk1/LmpwZw";
const notificationAuthToken =
    "key=AAAAAHP5NW8:APA91bF2-vqWD1UTmRwsZ1Y_Xr-eFkz-cQO19pVa13x17fG3Ol5zTqd-zGeWGpGsgdgiO1JjAdmnyL0fylqSs2f-RZbhPtxKXzGTWMtkDcXpSVOwg1-9JX0MqqlESLQGkC2gGNn5rQKL";
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
SizedBox height005 = SizedBox(height: screenHeight * 0.005);
SizedBox height05 = SizedBox(height: screenHeight * 0.01);
SizedBox height10 = SizedBox(height: screenHeight * 0.02);
SizedBox height20 = SizedBox(height: screenHeight * 0.04);
SizedBox height160 = SizedBox(height: screenHeight * 0.3);

//constant widths
SizedBox width10 = SizedBox(width: screenWidth * 0.03);
SizedBox width05 = SizedBox(width: screenWidth * 0.015);
SizedBox width20 = SizedBox(width: screenWidth * 0.06);
const fullWidth = SizedBox(width: double.infinity);

// constant divider
const divider = Divider(color: whiteColor);

// constant border radius

final radius10 = BorderRadius.circular(10);
final radius20 = BorderRadius.circular(20);

ValueNotifier<bool> isValid = ValueNotifier(false);
ValueNotifier<bool> isObscure = ValueNotifier(true);
ValueNotifier<bool> isAvailable = ValueNotifier(false);
ValueNotifier<bool> isEditMode = ValueNotifier(false);
ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
ValueNotifier<bool> isReadMore = ValueNotifier(false);

List<Widget> screens = const [
  HomeScreen(),
  SearchScreen(),
  NotificationScreen(),
  ProfileScreen(),
];

//

const usernameUpdateText = 'For your new username, type here...';
const nameUpdateText =
    "Help people discover your account by using the name you're known by: either your full name,nickname, or business name.";

//

final TextEditingController nameController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController bioController = TextEditingController();
