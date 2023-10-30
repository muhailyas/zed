import 'package:zed/data/models/post/post.dart';

abstract class PostRepository {
  Future<void> addPost(Post post);
  Future<List<Post>> fetchPosts();
  Future<void> deletePost(String postId);
  Future<void> addintoSavedPost(
      {required String postId, required String userId});
  Future<List<Post>> fetchSavedPosts({required String userId});
}
