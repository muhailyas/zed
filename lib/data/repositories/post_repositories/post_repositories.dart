import 'package:zed/data/models/post/post.dart';

abstract class PostRepository {
  Future<void> addPost(Post post);
  Future<List<Post>> fetchPosts();
}
