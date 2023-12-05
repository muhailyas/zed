import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/data_sources/notification_data_source/notification_data_source.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/like_repository/like_repositories.dart';

class LikeDataSource implements LikeRepository {
  @override
  Future<Post> toggleLike({required Post post, required String userId}) async {
    if (post.likes.contains(userId)) {
      post.likes.remove(userId);
    } else {
      post.likes.add(userId);
      if (post.userId != FirebaseAuth.instance.currentUser!.uid) {
        final user = await UserDataSource()
            .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
        NotificationDataSource().addNotifications(
          toId: post.userId,
          content: "${user!.userName} liked your post",
          token: user.token,
          type: post.imageUrl,
        );
      }
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .update({'likes': post.likes});
    return post;
  }
}
