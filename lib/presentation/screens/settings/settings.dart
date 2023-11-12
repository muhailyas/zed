import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/app_strings.dart';
import 'package:zed/utils/constants/constants.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // back button
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: whiteColor)),
                // heading text
                Text(
                  AppStrings.settingsAndPrivacy,
                  style: customFontStyle(),
                ),
              ],
            ),
            divider,
            height05,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Your account",
                  style: customFontStyle(size: 15, color: greyColor)),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(Icons.account_circle_outlined, color: whiteColor),
                  width10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account Center", style: customFontStyle(size: 17)),
                      Text("password, security, personal details",
                          style: customFontStyle(size: 12, color: greyColor)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height05,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Manage your connected experiences and account settings",
                style: customFontStyle(size: 14, color: greyColor),
              ),
            ),
            height10,
            divider,
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("How you use zed",
                  style: customFontStyle(color: greyColor, size: 15)),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.notification,
                    color: whiteColor,
                  ),
                  width10,
                  Text("Notifications", style: customFontStyle(size: 15)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.graph,
                    color: whiteColor,
                  ),
                  width10,
                  Text("Time spent", style: customFontStyle(size: 15)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            const Divider(color: greyColor, thickness: 1),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.notifications_off_sharp,
                    color: whiteColor,
                  ),
                  width10,
                  Text("Muted accounts", style: customFontStyle(size: 15)),
                  const Spacer(),
                  Text("5", style: customFontStyle(size: 15)),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.block,
                    color: whiteColor,
                  ),
                  width10,
                  Text("Blocked", style: customFontStyle(size: 15)),
                  const Spacer(),
                  Text("1", style: customFontStyle(size: 15)),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            const Divider(color: greyColor, thickness: 1),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "More info and support",
                style: customFontStyle(color: greyColor, size: 15),
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.support,
                    color: whiteColor,
                  ),
                  width10,
                  Text("Help", style: customFontStyle(size: 15)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.info_circle,
                    color: whiteColor,
                  ),
                  width10,
                  Text("About", style: customFontStyle(size: 15)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor)
                ],
              ),
            ),
            height10,
            const Divider(color: greyColor, thickness: 1),
            height10,
            Row(
              children: [
                width20,
                width20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: customFontStyle(size: 16, color: greyColor),
                    ),
                    height10,
                    SizedBox(
                      height: screenHeight / 20,
                      width: screenWidth / 1.17,
                      child: Row(
                        children: [
                          Text(
                            "Add account",
                            style:
                                customFontStyle(size: 16, color: secondaryBlue),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: whiteColor)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 20,
                      width: screenWidth / 1.17,
                      child: Row(
                        children: [
                          Text(
                            "Log out User12345",
                            style: customFontStyle(size: 16, color: red),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: whiteColor)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
