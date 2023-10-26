import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class FreindsListView extends StatelessWidget {
  final Friend type;
  const FreindsListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:
              Text(type.name.replaceRange(0, 1, 'F'), style: customFontStyle()),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => Container(
            height: screenHeight * 0.09,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Row(
              children: [
                width10,
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(test2),
                ),
                width10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sara Merry',
                        style: customFontStyle(
                            fontWeight: FontWeight.w400, size: 18)),
                    Row(
                      children: [
                        Text('@sara',
                            style: customFontStyle(
                                size: 13, fontWeight: FontWeight.w300)),
                        width10,
                        type == Friend.followers && index % 2 == 0
                            ? Text(
                                "follow",
                                style: customFontStyle(
                                    color: secondaryBlue, size: 16),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      color: secondaryDarkgrey, borderRadius: radius10),
                  child: Center(
                      child: Text(
                          type == Friend.following ? "following" : "remove",
                          style: customFontStyle(size: 16))),
                ),
                width10,
              ],
            ),
          ),
        ));
  }
}
