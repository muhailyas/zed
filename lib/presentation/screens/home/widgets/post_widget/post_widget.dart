import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/like/like_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/screens/comment_view/comment_screen.dart';
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
            _buildUserInfo(context),
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
                    builder: (context) => ScreenComment(postId: post.id!)));
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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return PopupMenuButton(
                      color: const Color.fromARGB(255, 4, 23, 32),
                      onSelected: (value) {
                        if (value == 1) {
                          context
                              .read<HomeBloc>()
                              .add(DeletePostEvent(postId: post.id!));
                        } else if (value == 2 && state is ProfileFetchSuccess) {
                          PostDataSource().addintoSavedPost(
                              postId: post.id!,
                              userId: state.userProfile!.uid!);
                        }
                      },
                      itemBuilder: (context) => getPopupMenuItemList(
                          post.userId !=
                              FirebaseAuth.instance.currentUser!.uid),
                      child: const Icon(Icons.more_vert_rounded,
                          color: whiteColor));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PopupMenuItem> getPopupMenuItemList(bool condition) {
    final popupMenuItems = [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            const Icon(
              Icons.delete,
              color: red,
              size: 17,
            ),
            width05,
            Text('Delete post', style: customFontStyle(size: 15, color: red)),
          ],
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: Row(
          children: [
            const Icon(
              Icons.bookmark,
              color: whiteColor,
              size: 17,
            ),
            width05,
            Text('Save post', style: customFontStyle(size: 15)),
          ],
        ),
      ),
      PopupMenuItem(
        value: 3,
        child: Row(
          children: [
            const Icon(
              Icons.report,
              color: red,
              size: 17,
            ),
            width05,
            Text('Report', style: customFontStyle(size: 15, color: red)),
          ],
        ),
      ),
    ];
    if (condition) {
      popupMenuItems.removeWhere((popupMenuItem) => popupMenuItem.value == 1);
    }
    if (FirebaseAuth.instance.currentUser!.uid == post.userId) {
      popupMenuItems.removeWhere((popupMenuItem) => popupMenuItem.value == 3);
    }

    return popupMenuItems;
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

  Widget _buildPostStats(BuildContext context) {
    context.read<LikeBloc>().add(LikeFetchEvent(postId: post.id!));
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.11),
        BlocBuilder<LikeBloc, LikeState>(
          builder: (context, state) {
            final liked =
                state.likes.contains(FirebaseAuth.instance.currentUser!.uid);
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<LikeBloc>().add(LikeButtonEvent(
                        postId: post.id!,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        likes: state.likes));
                  },
                  child: Icon(liked ? Iconsax.like_15 : Iconsax.like_14,
                      color: liked ? secondaryBlue : whiteColor),
                ),
                const SizedBox(width: 5),
                Text(
                  state.likes.length.toString(),
                  style: customFontStyle(size: 13, fontWeight: FontWeight.w300),
                ),
              ],
            );
          },
        ),
        SizedBox(width: screenWidth * 0.03),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ScreenComment(postId: post.id!),
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
        const Icon(
          Icons.insights,
          color: whiteColor,
        ),
        const SizedBox(width: 5),
        Text(
          post.views.toString(),
          style: customFontStyle(size: 13, fontWeight: FontWeight.w300),
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
