import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/screens/login_page/widgets/text_field/text_field.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            fullWidth,
            SizedBox(
              height: screenHeight * 0.225,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.12,
                    width: double.infinity,
                    color: secondaryBlue,
                  ),
                  Positioned(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              const Icon(Icons.arrow_back, color: whiteColor))),
                  Positioned(
                    right: screenHeight * 0.01,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Iconsax.edit, color: whiteColor),
                        label: Text("Edit cover photo",
                            style: customFontStyle(size: 15))),
                  ),
                  Positioned(
                    left: screenHeight * 0.01,
                    bottom: screenHeight * 0.04,
                    child: CircleAvatar(
                      radius: screenHeight * 0.07,
                      backgroundImage: const NetworkImage(defaultProfileImage),
                    ),
                  ),
                  Positioned(
                      bottom: -6,
                      left: screenHeight * 0.01,
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Edit profile photo",
                              style: customFontStyle(size: 15))))
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: TextEditingController(),
                      hint: 'Name',
                      iconData: Iconsax.edit_2,
                      function: () {}),
                  height10,
                  Text("Username", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: TextEditingController(),
                      hint: 'Username',
                      iconData: Iconsax.edit_2,
                      function: () {}),
                  height10,
                  Text("Bio", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: TextEditingController(),
                      hint: 'Bio',
                      iconData: Iconsax.edit_2,
                      function: () {}),
                  height10,
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButtonWidget(
                        width: 0.4,
                        height: 0.04,
                        fontSize: 16,
                        color: secondaryBlue,
                        label: 'Update profile',
                        onPressed: () {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
