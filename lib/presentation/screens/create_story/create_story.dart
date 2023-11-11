import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/app_strings.dart';
import 'package:zed/utils/constants/constants.dart';

class CreateStroyScreen extends StatelessWidget {
  const CreateStroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          // header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // close button
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, color: whiteColor, size: 30)),
              // add stroy text
              Text(AppStrings.addToStory, style: customFontStyle()),
              // post story button
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check, color: secondaryBlue, size: 30))
            ],
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // image take using camera button
              Container(
                height: screenHeight * 0.16,
                width: screenWidth / 2.2,
                decoration:
                    BoxDecoration(color: secondaryDark, borderRadius: radius20),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: whiteColor,
                  size: 35,
                ),
              ),
              // image select from gallery
              Container(
                height: screenHeight * 0.16,
                width: screenWidth / 2.2,
                decoration:
                    BoxDecoration(color: secondaryDark, borderRadius: radius20),
                child: const Icon(
                  Icons.image,
                  color: whiteColor,
                  size: 35,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
