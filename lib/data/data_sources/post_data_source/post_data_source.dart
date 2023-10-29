import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repository/post_repositories.dart';

class PostDataSource extends PostRepository {
  final CollectionReference _postCollection =
      FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addPost(Post post) async {
    try {
      final document = _postCollection.doc();
      final postId = document.id;
      await _postCollection
          .doc(document.id)
          .set({...post.toJson(), 'id': postId});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final posts = await _postCollection.get();
      return posts.docs.map((post) {
        return Post.fromJson(post);
      }).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
