import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
  });

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
              radius: screenWidth * 0.075,
              backgroundImage: const NetworkImage(test2),
            ),
            width10,
            SizedBox(
              width: screenWidth * 0.65,
              child: Text(
                "Luca liked your photo ",
                overflow: TextOverflow.ellipsis,
                style: customFontStyle(fontWeight: FontWeight.w400, size: 18),
              ),
            ),
            const Spacer(),
            Container(
              height: screenHeight * .07,
              width: screenWidth * 0.12,
              decoration: BoxDecoration(
                  borderRadius: radius10 / 3,
                  image: const DecorationImage(
                      image: NetworkImage(testImage), fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }
}
