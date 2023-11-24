import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/data_sources/comment_data_source/comment_data_source.dart';
import 'package:zed/data/data_sources/like_data_source/like_data_souce.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({super.key, required this.post, this.comment});
  final Post post;
  final Comment? comment;

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    bool isLiked =
        widget.post.likes.contains(FirebaseAuth.instance.currentUser!.uid);
    return Row(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            final userId = FirebaseAuth.instance.currentUser!.uid;
            if (widget.comment == null) {
              LikeDataSource().toggleLike(post: widget.post, userId: userId);
            } else {
              CommentDataSource().toggleLikecomment(
                  postId: widget.post.id!,
                  userId: userId,
                  comment: widget.comment!);
            }
            setState(() {});
          },
          child: widget.comment == null
              ? Icon(isLiked ? Iconsax.like_15 : Iconsax.like_14,
                  color: isLiked ? secondaryBlue : whiteColor)
              : Icon(
                  widget.comment!.likedBy
                          .contains(FirebaseAuth.instance.currentUser!.uid)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: widget.comment!.likedBy
                          .contains(FirebaseAuth.instance.currentUser!.uid)
                      ? red
                      : greyColor,
                  size: 20,
                ),
        ),
        const SizedBox(width: 5),
        Text(
          widget.comment == null
              ? widget.post.likes.length.toString()
              : widget.comment!.likedBy.length.toString(),
          style: customFontStyle(size: 13, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
