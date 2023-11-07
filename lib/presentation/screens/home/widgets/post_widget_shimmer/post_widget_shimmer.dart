import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ShimmerPostWidget extends StatelessWidget {
  const ShimmerPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: secondaryDarkgrey,
            highlightColor: secondaryDark,
            child: Row(
              children: [
                CircleAvatar(
                  radius: screenHeight * 0.018,
                  backgroundColor: greyColor,
                ),
                width05,
                Container(
                  height: screenHeight * 0.035,
                  width: screenWidth * 0.84,
                  decoration: BoxDecoration(
                      color: greyColor, borderRadius: radius10 / 2),
                )
              ],
            ),
          ),
          height005,
          Shimmer.fromColors(
            baseColor: secondaryDarkgrey,
            highlightColor: secondaryDark,
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.095,
                ),
                Container(
                  width: screenWidth * 0.84,
                  height: screenHeight * 0.3,
                  decoration: BoxDecoration(
                      color: greyColor, borderRadius: radius10 / 2),
                ),
              ],
            ),
          ),
          height005,
        ],
      ),
    );
  }
}
