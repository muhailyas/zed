import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repository/user_repositories.dart';

class UserDataSource implements UserRepository {
  @override
  Future<void> addUser(UserProfile profile) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final DocumentReference userProfile =
        collection.doc(FirebaseAuth.instance.currentUser!.uid);
    await userProfile.set(profile.toJson());
  }

  @override
  updateUser(UserProfile profile) {}

  @override
  Future<UserProfile?> getUserByUid(String uid) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .limit(1)
        .get();
    if (result.docs.isNotEmpty) {
      final data = result.docs.first.data();
      return UserProfile.fromJson(data);
    }
    return null;
  }

  @override
  Future<List<Post>> getUserPosts(String uid) async {
    try {
      final posts = await FirebaseFirestore.instance
          .collection('posts')
          .where('userId', isEqualTo: uid)
          .get();
      return posts.docs.map((post) => Post.fromJson(post)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<UserProfile>> searchUsersByUsername(String username) async {
    if (username.isEmpty) return [];

    final usersCollection = FirebaseFirestore.instance.collection('users');
    final userProfiles = <UserProfile>[];
    final queryFields = ['userName', 'fullname'];

    try {
      for (final field in queryFields) {
        final querySnapshot = await usersCollection
            .where(field, isGreaterThanOrEqualTo: username)
            .where(field, isLessThan: '${username}z')
            .get();

        for (final doc in querySnapshot.docs) {
          final userData = doc.data();
          final userProfile = UserProfile.fromJson(userData);
          userProfiles.add(userProfile);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return userProfiles;
  }
}
