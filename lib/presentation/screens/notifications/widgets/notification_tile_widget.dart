import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/models/notification/notification.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({super.key, required this.notification});
  final NotificationWithUserProfile notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.09,
      width: double.infinity,
      decoration:
          BoxDecoration(color: secondaryDark, borderRadius: radius10 / 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: CachedNetworkImageProvider(
                  notification.userProfile.profilePhoto),
            ),
            width10,
            SizedBox(
              width: screenWidth * 0.64,
              child: Text(
                    notification.notification.content,
                overflow: TextOverflow.ellipsis,
                style: customFontStyle(fontWeight: FontWeight.w400, size: 18),
              ),
            ),
            const Spacer(),
            notification.notification.content.contains('post')
                ? Container(
                    height: screenHeight * .07,
                    width: screenWidth * 0.12,
                    decoration: BoxDecoration(
                        borderRadius: radius10 / 3,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                notification.notification.type!),
                            fit: BoxFit.cover)),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
