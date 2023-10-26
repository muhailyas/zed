import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

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
            height005,
            _buildCommentView(),
            height005,
            _buildPublishedDate(),
            height005,
          ],
        ),
      ),
    );
  }

  Row _buildPublishedDate() {
    String formattedDate = formatTimeDifference(post.dateTime);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        Text(formattedDate, style: customFontStyle(size: 14, color: greyColor)),
      ],
    );
  }

  Widget _buildCommentView() {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        Text(post.commentCount == 0 ? "View comments" : "View all 200 comments",
            style: customFontStyle(size: 15, color: greyColor)),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: screenHeight * 0.018,
          backgroundImage:
              NetworkImage(post.profileUrl.isEmpty ? test2 : post.profileUrl),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post.username,
                style: customFontStyle(size: 20, fontWeight: FontWeight.w700),
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
                width: screenWidth * 0.83,
                decoration: BoxDecoration(
                  borderRadius: radius10,
                ),
                child: Image.network(
                  post.imageUrl,
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
          post.likes.toString(),
          style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
        ),
        SizedBox(width: screenWidth * 0.03),
        const Icon(
          Iconsax.message_2,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          post.commentCount.toString(),
          style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
        ),
        width10,
        const Icon(
          Icons.insights,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          post.views.toString(),
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
          width: screenWidth * 0.83,
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "${post.username}  ",
                  style: customFontStyle(size: 16, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption, style: customFontStyle(size: 14)),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
