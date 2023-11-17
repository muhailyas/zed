import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class StoryItemShimmer extends StatelessWidget {
  const StoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: secondaryDarkgrey,
          highlightColor: secondaryDark,
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.2,
                decoration: const BoxDecoration(
                  color: secondaryDark,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                  height: screenHeight * 0.015,
                  width: screenWidth * 0.18,
                  color: secondaryDark),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => width10,
    );
  }
}
