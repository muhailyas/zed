import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/follow_data_sources/follow_data_sources.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget(
      {super.key,
      this.height = 40,
      this.width = 100,
      this.fontSize = 20,
      required this.userProfile});
  final double height;
  final double width;
  final double fontSize;
  final UserProfile userProfile;

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        if (widget.userProfile.followers
            .contains(FirebaseAuth.instance.currentUser!.uid)) {
          widget.userProfile.followers
              .remove(FirebaseAuth.instance.currentUser!.uid);
        } else {
          widget.userProfile.followers
              .add(FirebaseAuth.instance.currentUser!.uid);
        }
        FollowDataSources().followUser(
            uid: FirebaseAuth.instance.currentUser!.uid,
            followId: widget.userProfile.uid!);
        setState(() {});
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.userProfile.followers
                  .contains(FirebaseAuth.instance.currentUser!.uid)
              ? secondaryDarkgrey
              : secondaryBlue,
          borderRadius: radius20,
        ),
        child: Center(
            child: Text(
                widget.userProfile.followers
                        .contains(FirebaseAuth.instance.currentUser!.uid)
                    ? 'following'
                    : 'follow',
                style: customFontStyle(size: widget.fontSize))),
      ),
    );
  }
}
