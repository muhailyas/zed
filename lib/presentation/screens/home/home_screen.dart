import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/screens/chat_list/chat_list.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            _buildStoryList(),
            divider,
            _buildPostList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ZED",
            style: customFontStyle(size: 35, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChatListScreen(),
              ));
            },
            child: const Icon(Iconsax.message, color: whiteColor, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryList() {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildStoryItem(index),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    return Column(
      children: [
        Container(
          height: screenHeight * 0.07,
          width: screenWidth * 0.16,
          decoration: const BoxDecoration(
            color: secondaryDark,
            shape: BoxShape.circle,
          ),
          child: index == 0
              ? const Icon(Icons.add, size: 30, color: whiteColor)
              : null,
        ),
        Text(index == 0 ? "My story" : "username",
            style: customFontStyle(size: 14)),
      ],
    );
  }

  Widget _buildPostList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(top: 0),
        child: PostWidget(
            caption: "Embracing the simple joys of life on this beautiful day! 🌞💕 Grateful for moments filled with laughter, sunshine, and good company. Let's spread happiness like confetti! 🎉😄",
            comments: 10,
            likes: 10,
            postImage: testImage,
            userProfileImage: testImage,
            username: 'ilyas',
            views: 10),
      ),
      separatorBuilder: (context, index) => const Divider(color: whiteColor),
      itemCount: 4,
    );
  }
}
