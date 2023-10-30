import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class CommentInputWidget extends StatelessWidget {
  const CommentInputWidget({super.key, required this.postId});
  final String postId;

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<CommentBloc>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: const NetworkImage(test2),
            radius: screenHeight * 0.023,
          ),
          width05,
          Expanded(
            child: TextField(
              controller: blocProvider.commentController,
              style: customFontStyle(size: 15),
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                hintText: 'Add a comment for user...',
                hintStyle: customFontStyle(size: 15),
              ),
            ),
          ),
          TextButton(
              onPressed: () async {
                if (blocProvider.commentController.text.isEmpty) {
                  return;
                }
                final userId = FirebaseAuth.instance.currentUser!.uid;
                final commentText = blocProvider.commentController.text.trim();
                final comment = Comment(
                    postId: postId,
                    userId: userId,
                    text: commentText,
                    dateTime: DateTime.now(),
                    likedBy: []);
                blocProvider.add(CommentAddEvent(comment: comment));
                blocProvider.commentController.clear();
              },
              child: Text("Post",
                  style: customFontStyle(color: secondaryBlue, size: 15)))
        ],
      ),
    );
  }
}
