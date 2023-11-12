import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/follow_data_source/follow_data_source.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget(
      {super.key,
      this.height = 40,
      this.width = 100,
      this.fontSize = 20,
      required this.userProfile,
      this.type});
  final double height;
  final double width;
  final double fontSize;
  final UserProfile userProfile;
  final Friend? type;

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () async {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        if (widget.userProfile.followers.contains(userId)) {
          widget.userProfile.followers.remove(userId);
          FollowDataSources()
              .unfollowUser(uid: userId, followId: widget.userProfile.uid!);
        } else {
          widget.userProfile.followers.add(userId);
          FollowDataSources()
              .followUser(uid: userId, followId: widget.userProfile.uid!);
        }
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
                    : widget.userProfile.following
                            .contains(FirebaseAuth.instance.currentUser!.uid)
                        ? 'follow back'
                        : 'follow',
                style: customFontStyle(size: widget.fontSize))),
      ),
    );
  }
}
