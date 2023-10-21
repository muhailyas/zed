import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/post/post.dart';

class PostRepository {
  final CollectionReference _postCollection =
      FirebaseFirestore.instance.collection('posts');
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
}
