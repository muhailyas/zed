import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:zed/data/repositories/like_repository/like_repositories.dart';

class LikeDataSource implements LikeRepository {
  @override
  Future<List<String>> fetchLikes(String postId) async {
    final document =
        await FirebaseFirestore.instance.collection('posts').doc(postId).get();
    if (document.exists && document.data() != null) {
      final List<dynamic> likes = document.data()!['likes'] ?? [];
      return likes.cast<String>().toList();
    }
    return [];
  }

  @override
  Future<void> addLike(String postId, String userId) async {
    await FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayUnion([userId])
    });
  }

  @override
  Future<void> disLike(String postId, String userId) async {
    await FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayRemove([userId])
    });
  }

  @override
  Future<Either<String, bool>> toggleLike(
      String postId, String userId, List likes) async {
    try {
      if (likes.contains(userId)) {
        await disLike(postId, userId);
        return const Right(false);
      } else {
        await addLike(postId, userId);
        return const Right(true);
      }
    } catch (e) {
      return Left('Error:$e');
    }
  }
}
