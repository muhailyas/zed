import 'package:dartz/dartz.dart';
import 'package:zed/data/models/comment/comment.dart';

abstract class CommentRepository {
  Future<Either<String, bool>> addComment(
      {required String postId, required Comment comment});
  Future<Either<String, bool>> deleteComment(
      {required String commentId, required String postId});
  Future<List<Comment>> fetchComments({required postId});
  Future<List<CommentWithUserProfile>> fetchUserProfilesForComments(
    List<Comment> comments,
  );
}