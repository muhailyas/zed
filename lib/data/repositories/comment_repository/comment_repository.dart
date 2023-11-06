import 'package:zed/data/models/comment/comment.dart';

abstract class CommentRepository {
  Future<void> addComment({required String postId, required Comment comment});
  Future<void> deleteComment(
      {required String commentId, required String postId});
  Future<List<Comment>> fetchComments({required postId});
  Future<List<CommentWithUserProfile>> fetchUserProfilesForComments(
    List<Comment> comments,
  );
  Future<void> incrementCommentCount({required String postId});
  Future<void> decrementCommentCount({required String postId});
  Future<void> toggleLikecomment(
      {required String postId,
      required String userId,
      required Comment comment});
}
