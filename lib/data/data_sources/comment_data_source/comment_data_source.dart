import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/data/repositories/comment_repository/comment_repository.dart';

class CommentDataSource extends CommentRepository {
  @override
  Future<void> addComment(
      {required String postId, required Comment comment}) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('posts')
          .doc(comment.postId)
          .collection('comments')
          .doc();
      collection.set({...comment.toJson(), 'commentid': collection.id});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteComment(
      {required String commentId, required String postId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
      return const Right(true);
    } catch (e) {
      return Left('error$e');
    }
  }

  @override
  Future<List<Comment>> fetchComments({required postId}) async {
    try {
      final comments = await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .orderBy('commentpublished', descending: true)
          .get();
      final response = comments.docs
          .map((comment) => Comment.fromSnapshot(comment))
          .toList();
      return response;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<CommentWithUserProfile>> fetchUserProfilesForComments(
    List<Comment> comments,
  ) async {
    final List<CommentWithUserProfile> commentsWithUserProfiles = [];

    for (var comment in comments) {
      final userProfile = await UserDataSource().getUserByUid(comment.userId);
      commentsWithUserProfiles.add(CommentWithUserProfile(
        comment: comment,
        userProfile: userProfile!,
      ));
    }

    return commentsWithUserProfiles;
  }

  @override
  Future<void> incrementCommentCount({required String postId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'commentCount': FieldValue.increment(1)});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> toggleLikecomment(
      {required String postId,
      required String userId,
      required Comment comment}) async {
    if (comment.likedBy.contains(userId)) {
      comment.likedBy.remove(userId);
    } else {
      comment.likedBy.add(userId);
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(comment.id)
        .update({'likedBy': comment.likedBy});
  }
}
