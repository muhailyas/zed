import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class CommentTileShimmerWidget extends StatelessWidget {
  const CommentTileShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryDarkgrey,
      highlightColor: secondaryDark,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: screenHeight * 0.023,
              backgroundColor: secondaryDarkgrey,
            ),
            width10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.65,
                      height: screenHeight * 0.02,
                      decoration: BoxDecoration(
                          color: secondaryDarkgrey, borderRadius: radius10 / 2),
                    ),
                    width05,
                    Container(
                      width: screenWidth * 0.13,
                      height: screenHeight * 0.02,
                      decoration: BoxDecoration(
                          color: secondaryDarkgrey, borderRadius: radius10 / 2),
                    ),
                  ],
                ),
                height005,
                Container(
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.82),
                  child: Container(
                    width: screenWidth * 0.794,
                    height: screenHeight * 0.02,
                    decoration: BoxDecoration(
                        color: secondaryDarkgrey, borderRadius: radius10 / 2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
