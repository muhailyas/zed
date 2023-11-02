import 'package:flutter/material.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/widgets/like_widget/like_widget.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class CommentTileWidget extends StatelessWidget {
  const CommentTileWidget(
      {super.key, required this.comment, required this.post});
  final CommentWithUserProfile comment;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final date = formatTimeDifference(comment.comment.dateTime);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: screenHeight * 0.023,
            backgroundImage: NetworkImage(
                comment.userProfile.profilePhoto.isEmpty
                    ? defaultProfileImage
                    : comment.userProfile.profilePhoto),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.82),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${comment.userProfile.userName}   ",
                            style: customFontStyle(size: 15),
                          ),
                          TextSpan(
                            text: date,
                            style: customFontStyle(size: 10),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    LikeButtonWidget(post: post, comment: comment.comment)
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.82),
                child: Text(
                  comment.comment.text,
                  textAlign: TextAlign.justify,
                  style: customFontStyle(size: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
