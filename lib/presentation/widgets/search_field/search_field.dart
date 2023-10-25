import 'package:flutter/material.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: primaryColor, borderRadius: radius10),
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          style: customFontStyle(),
          onChanged: (value) async {},
          decoration: InputDecoration(
              hintStyle: customFontStyle(size: 16),
              prefixIcon: const Icon(Icons.search_rounded, color: whiteColor),
              hintText: 'Search',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

ValueNotifier<List<UserProfile>> listN = ValueNotifier([]);
