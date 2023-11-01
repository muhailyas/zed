import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/like_repository/like_repositories.dart';

class LikeDataSource implements LikeRepository {
  @override
  Future<Post> toggleLike({required Post post, required String userId}) async {
    if (post.likes.contains(userId)) {
      post.likes.remove(userId);
    } else {
      post.likes.add(userId);
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .update({'likes': post.likes});
    return post;
  }
}
