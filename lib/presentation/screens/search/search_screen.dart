import 'package:flutter/material.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            height05,
            Padding(
              padding: const EdgeInsets.all(0),
              child: SearchFieldWidget(width: screenWidth * 1),
            ),
            height05,
            // GridView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: 10,
            //   shrinkWrap: true,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 10),
            //   itemBuilder: (context, index) => Container(
            //     decoration: BoxDecoration(
            //         color: secondaryDark, borderRadius: radius10),
            //   ),
            // ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                      height: 70,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          width10,
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                          ),
                          width10,
                          Text('ilyas', style: customFontStyle()),
                          const Spacer(),
                          ElevatedButtonWidget(
                              color: secondaryBlue,
                              label: 'follow',
                              fontWeight: FontWeight.w400,
                              width: 0.25,
                              height: 0.03,
                              onPressed: () {}),
                          width10,
                        ],
                      ),
                    ),
                // separatorBuilder: (context, index) => Container(
                //     width: double.infinity, color: whiteColor, height: 0.1),
                itemCount: 10),
          ],
        ),
      ),
    );
  }
}
