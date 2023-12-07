import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';
import 'package:zed/business_logic/bottom_nav/bottom_navigation_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/presentation/screens/about/about.dart';
import 'package:zed/presentation/screens/archived_stories/archived_stories.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/posts/posts.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/app_strings.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/url_launcher/url_launcher.dart';

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
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("How you use zed",
                  style: customFontStyle(color: greyColor, size: 15)),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  context
                      .read<BottomNavigationBloc>()
                      .add(IndexChagerEvent(index: 2));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.notification,
                      color: whiteColor,
                    ),
                    width10,
                    Text("Notifications", style: customFontStyle(size: 15)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
              ),
            ),
            height10,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenHightlights()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.lovely,
                      color: whiteColor,
                    ),
                    width10,
                    Text("Stories archive", style: customFontStyle(size: 15)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
              ),
            ),
            height10,
            InkWell(
              onTap: () {
                context
                    .read<PostBloc>()
                    .add(FetchPostsOrSavedPosts(isSavedPost: false));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostList(
                              isSavedPost: false,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.grid_1,
                      color: whiteColor,
                    ),
                    width10,
                    Text("Posts", style: customFontStyle(size: 15)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
              ),
            ),
            height10,
            InkWell(
              onTap: () {
                context
                    .read<PostBloc>()
                    .add(FetchPostsOrSavedPosts(isSavedPost: true));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostList(
                              isSavedPost: true,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.save_2,
                      color: whiteColor,
                    ),
                    width10,
                    Text("Saved posts", style: customFontStyle(size: 15)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
              ),
            ),
            height10,
            const Divider(color: greyColor, thickness: 1),
            height10,
            InkWell(
              onTap: () {
                launchhUrI();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.privacy_tip_outlined,
                      color: whiteColor,
                    ),
                    width10,
                    Text("Privacy Policy", style: customFontStyle(size: 15)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
              ),
            ),
            height10,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenAbout()));
              },
              child: Padding(
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
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: whiteColor)
                  ],
                ),
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
