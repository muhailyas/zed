import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
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
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) => current is LogoutSuccess,
              listener: (context, state) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                    (route) => false);
              },
              child: InkWell(
                onTap: () {
                  _logoutDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: red),
                      width10,
                      Text(
                        "Log out ",
                        style: customFontStyle(size: 16, color: red),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          color: whiteColor)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Are you sure ?", style: customFontStyle()),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: whiteColor, size: 16))
            ],
          ),
          content: Text("Please confirm if you want to logout",
              style: customFontStyle(size: 15.5)),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButtonWidget(
                    color: red,
                    label: 'confirm',
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                      Navigator.pop(context);
                    },
                    width: .7),
                height10
              ],
            )
          ],
        );
      },
    );
  }
}
