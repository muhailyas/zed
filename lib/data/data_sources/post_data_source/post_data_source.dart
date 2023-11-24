import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Future<void> deletePost(String postId) async {
    try {
      await _postCollection.doc(postId).delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> addintoSavedPost({
    required String postId,
    required String userId,
  }) async {
    try {
      final path = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('saved posts')
          .doc(postId);
      await path.set({
        'postId': postId,
      });
      FirebaseFirestore.instance.collection('posts').doc(postId).update({
        'savedIds': FieldValue.arrayUnion([userId])
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> deleteSavedPost({
    required String postId,
    required String userId,
  }) async {
    try {
      final path = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('saved posts')
          .doc(postId);
      FirebaseFirestore.instance.collection('posts').doc(postId).update({
        'savedIds': FieldValue.arrayRemove([userId])
      });
      await path.delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Post>> fetchSavedPosts({required String userId}) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('saved posts')
          .get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      }
      final postIds = querySnapshot.docs.map((e) => e['postId']).toList();
      final posts = await FirebaseFirestore.instance
          .collection('posts')
          .where('id', whereIn: postIds)
          .get();
      return posts.docs.map((e) => Post.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> updateProfileInPost(String url) async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot postSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('userId', isEqualTo: currentUserUid)
        .get();
    for (QueryDocumentSnapshot postDoc in postSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postDoc.id)
          .update({'profileurl': url});
    }
  }
}
