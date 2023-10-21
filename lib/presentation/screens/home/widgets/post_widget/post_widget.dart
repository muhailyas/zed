import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class PostWidget extends StatelessWidget {
  final String userProfileImage;
  final String username;
  final String postImage;
  final int likes;
  final int comments;
  final int views;
  final String caption;

  const PostWidget({
    Key? key,
    required this.userProfileImage,
    required this.username,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.views,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            _buildUserInfo(),
            _buildPostImage(),
            height05,
            _buildPostStats(),
            height05,
            _buildPostCaption(),
            height05,
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: screenHeight * 0.018,
          backgroundImage: NetworkImage(userProfileImage),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                username,
                style: customFontStyle(size: 20),
              ),
              const Icon(Icons.more_vert_rounded, color: whiteColor),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPostImage() {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        Column(
          children: [
            ClipRRect(
              borderRadius: radius10,
              child: Container(
                constraints: BoxConstraints(maxHeight: screenHeight * 0.4),
                width: screenWidth * 0.84,
                decoration: BoxDecoration(
                  borderRadius: radius10,
                ),
                child: Image.network(
                  postImage,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPostStats() {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        const Icon(
          Iconsax.like_14,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          likes.toString(),
          style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
        ),
        SizedBox(width: screenWidth * 0.03),
        const Icon(
          Iconsax.message_2,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          comments.toString(),
          style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
        ),
        width10,
        const Icon(
          Icons.insights,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          views.toString(),
          style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
        ),
        const Spacer(),
        const Icon(Icons.share, color: whiteColor, size: 25),
      ],
    );
  }

  Widget _buildPostCaption() {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        SizedBox(
          width: screenWidth * 0.84,
          child: Text(
            caption,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            textAlign: TextAlign.justify,
            style: customFontStyle(size: 16),
          ),
        ),
      ],
    );
  }
}
