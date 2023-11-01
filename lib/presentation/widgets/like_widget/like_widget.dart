import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/data_sources/like_data_source/like_data_souce.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({super.key, required this.post});
  final Post post;

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            LikeDataSource().toggleLike(
                post: widget.post,
                userId: FirebaseAuth.instance.currentUser!.uid);
            setState(() {});
          },
          child: Icon(
              widget.post.likes.contains(FirebaseAuth.instance.currentUser!.uid)
                  ? Iconsax.like_15
                  : Iconsax.like_14,
              color: widget.post.likes
                      .contains(FirebaseAuth.instance.currentUser!.uid)
                  ? secondaryBlue
                  : whiteColor),
        ),
        const SizedBox(width: 5),
        Text(
          widget.post.likes.length.toString(),
          style: customFontStyle(size: 13, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
