// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/bottom_nav/bottom_navigation_bloc.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/screens/comment_view/comment_screen.dart';
import 'package:zed/presentation/screens/home/widgets/popup_menu_button/popup_menu_button.dart';
import 'package:zed/presentation/screens/visit_profile/visit_profile.dart';
import 'package:zed/presentation/widgets/like_widget/like_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:awesome_icons/awesome_icons.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        child: Column(
          children: [
            _buildUserInfo(context),
            height005,
            _buildPostImage(),
            height05,
            _buildPostStats(context),
            height05,
            _buildPostCaption(),
            height005,
            _buildCommentView(context),
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

  Widget _buildCommentView(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => ScreenComment(post: post)));
          },
          child: Text(
              post.commentCount == 0
                  ? "View comments"
                  : "View all ${post.commentCount} comments",
              style: customFontStyle(size: 15, color: greyColor)),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    context
        .read<ProfileBloc>()
        .add(ProfileFetchEvent(userId: FirebaseAuth.instance.currentUser!.uid));
    return Row(
      children: [
        CircleAvatar(
          radius: screenHeight * 0.018,
          backgroundImage: NetworkImage(
              post.profileUrl.isEmpty ? defaultProfileImage : post.profileUrl),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (post.userId == FirebaseAuth.instance.currentUser!.uid) {
                    context
                        .read<BottomNavigationBloc>()
                        .add(IndexChagerEvent(index: 3));
                  } else {
                    final user =
                        await UserDataSource().getUserByUid(post.userId);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenVisitProfile(userProfile: user!),
                        ));
                  }
                },
                child: Text(
                  post.username,
                  style: customFontStyle(size: 20, fontWeight: FontWeight.w700),
                ),
              ),
              PopupMenuButtonWidget(postId: post.id!, uid: post.userId)
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
                child: CachedNetworkImage(
                    imageUrl: post.imageUrl, fit: BoxFit.cover),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPostStats(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        LikeButtonWidget(post: post),
        SizedBox(width: screenWidth * 0.03),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ScreenComment(post: post),
                ));
          },
          child: const Icon(
            Iconsax.messages_34,
            color: whiteColor,
          ),
        ),
        const SizedBox(width: 5),
        BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            return Text(
              post.commentCount.toString(),
              style: customFontStyle(size: 13, fontWeight: FontWeight.w300),
            );
          },
        ),
        width10,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: const Icon(FontAwesomeIcons.telegramPlane, color: whiteColor),
        ),
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
