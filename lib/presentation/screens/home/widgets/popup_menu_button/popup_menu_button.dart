import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget(
      {super.key, required this.post, required this.uid});
  final Post post;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: const Color.fromARGB(255, 4, 23, 32),
        onSelected: (value) {
          if (value == 1) {
            context.read<HomeBloc>().add(DeletePostEvent(postId: post.id!));
          } else if (value == 2) {
            if (post.savedIds
                .contains(FirebaseAuth.instance.currentUser!.uid)) {
              PostDataSource().deleteSavedPost(
                  postId: post.id!,
                  userId: FirebaseAuth.instance.currentUser!.uid);
              post.savedIds.remove(FirebaseAuth.instance.currentUser!.uid);
            } else {
              PostDataSource().addintoSavedPost(
                  postId: post.id!,
                  userId: FirebaseAuth.instance.currentUser!.uid);
              post.savedIds.add(FirebaseAuth.instance.currentUser!.uid);
            }
          }
        },
        itemBuilder: (context) => getPopupMenuItemList(),
        child: const Icon(Icons.more_vert_rounded, color: whiteColor));
  }

  List<PopupMenuItem> getPopupMenuItemList() {
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
            Icon(
              post.savedIds.contains(FirebaseAuth.instance.currentUser!.uid)
                  ? Icons.remove_circle_outline_rounded
                  : Icons.bookmark,
              color:
                  post.savedIds.contains(FirebaseAuth.instance.currentUser!.uid)
                      ? red
                      : whiteColor,
              size: 17,
            ),
            width05,
            Text(
                post.savedIds.contains(FirebaseAuth.instance.currentUser!.uid)
                    ? 'Remove saved'
                    : 'Save post',
                style: customFontStyle(
                    size: 15,
                    color: post.savedIds
                            .contains(FirebaseAuth.instance.currentUser!.uid)
                        ? red
                        : whiteColor)),
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
    if (FirebaseAuth.instance.currentUser!.uid != uid) {
      popupMenuItems.removeWhere((popupMenuItem) => popupMenuItem.value == 1);
    }
    if (FirebaseAuth.instance.currentUser!.uid == uid) {
      popupMenuItems.removeWhere((popupMenuItem) => popupMenuItem.value == 3);
    }

    return popupMenuItems;
  }
}
