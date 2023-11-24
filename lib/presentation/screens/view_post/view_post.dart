import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/screens/comment_view/comment_screen.dart';
import 'package:zed/presentation/screens/home/widgets/popup_menu_button/popup_menu_button.dart';
import 'package:zed/presentation/widgets/like_widget/like_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class ScreenViewPost extends StatelessWidget {
  const ScreenViewPost({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Post", style: customFontStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(post.profileUrl),
                ),
                width10,
                Text(
                  post.username,
                  style: customFontStyle(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButtonWidget(post: post, uid: post.userId)
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                height05,
                ClipRRect(
                  borderRadius: radius10,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: screenHeight * 0.4),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: radius10,
                    ),
                    child: CachedNetworkImage(
                        imageUrl: post.imageUrl, fit: BoxFit.cover),
                  ),
                )
              ],
            ),
            height05,
            Row(
              children: [
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
                      style: customFontStyle(
                          size: 13, fontWeight: FontWeight.w300),
                    );
                  },
                ),
                width10,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: InkWell(
                      onTap: () async {
                        Share.shareUri(Uri.parse(post.imageUrl));
                      },
                      child: const Icon(FontAwesomeIcons.telegramPlane,
                          color: whiteColor)),
                ),
              ],
            ),
            height05,
            SizedBox(
              width: screenWidth,
              child: InkWell(
                child: RichText(
                  maxLines: null,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "${post.username}  ",
                        style: customFontStyle(
                            size: 16, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: post.caption, style: customFontStyle(size: 14)),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            height05,
            Text(
                post.commentCount == 0
                    ? "View comments"
                    : "View all ${post.commentCount} comments",
                style: customFontStyle(size: 15, color: greyColor)),
            height05,
            Text(formatTimeDifference(post.dateTime),
                style: customFontStyle(size: 14, color: greyColor)),
          ],
        ),
      ),
    );
  }
}
