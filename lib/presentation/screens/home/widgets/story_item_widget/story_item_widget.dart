import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget(
      {super.key, required this.index, required this.storyWithUser});
  final int index;
  final StoryWithUser storyWithUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2,
          decoration: BoxDecoration(
              color: secondaryDark,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(index == 0 &&
                          storyWithUser.userProfile.profilePhoto.isEmpty
                      ? defaultProfileImage
                      : storyWithUser.userProfile.profilePhoto),
                  fit: BoxFit.cover)),
          child: index == 0
              ? const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Iconsax.add_circle5, size: 25, color: whiteColor))
              : null,
        ),
        Text(index == 0 ? "Your story" : storyWithUser.userProfile.userName,
            style: customFontStyle(size: 14)),
      ],
    );
  }
}
