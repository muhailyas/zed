import 'package:dartz/dartz.dart';

abstract class LikeRepository {
  Future<Either<String, bool>> toggleLike(
      String postId, String userId, List likes);
  Future<void> addLike(String postId, String userId);
  Future<void> disLike(String postId, String userId);
  Future<List<String>> fetchLikes(String postId);
}
