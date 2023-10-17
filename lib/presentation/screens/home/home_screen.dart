import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/screens/chat_list/chat_list.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

import 'widgets/post_widget/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ZED",
                    style:
                        customFontStyle(size: 35, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChatListScreen(),
                        ));
                      },
                      child: const Icon(Iconsax.message,
                          color: whiteColor, size: 30))
                ],
              ),
            ),
            SizedBox(
              height: 90,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: secondaryDark, shape: BoxShape.circle),
                      child: index == 0
                          ? const Icon(Icons.add, size: 30, color: whiteColor)
                          : null,
                    ),
                    Text(index == 0 ? "My story" : "username",
                        style: customFontStyle(size: 14))
                  ],
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            height05,
            const Divider(color: whiteColor),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: PostWidget(),
                    ),
                separatorBuilder: (context, index) =>
                    const Divider(color: whiteColor),
                itemCount: 10),
          ],
        ),
      ),
    );
  }
}
