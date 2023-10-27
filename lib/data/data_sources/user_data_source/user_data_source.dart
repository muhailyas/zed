import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repositories/user_repositories.dart';

class UserDataSource implements UserRepository {
  @override
  Future<void> addUser(UserProfile profile) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final DocumentReference userProfile = collection.doc();
    final Map<String, dynamic> userData = {
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'id': userProfile.id,
      'username': profile.userName,
      'fullname': profile.fullname,
      'email': profile.email,
      'mobile': profile.mobile,
      'bio': profile.bio,
      'gender': profile.gender,
      'profilephoto': profile.profilePhoto,
      'coverphoto': profile.coverPhoto,
      'birthday': profile.birthday,
      'isprivate': profile.isPrivate
    };
    await userProfile.set(userData);
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
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    final userProfiles = <UserProfile>[];
    try {
      final querySnapshotUsername = await usersCollection
          .where('username', isGreaterThanOrEqualTo: username)
          .where('username', isLessThan: '${username}z')
          .get();
      final querySnapshotFullname = await usersCollection
          .where('fullname', isGreaterThanOrEqualTo: username)
          .where('fullname', isLessThan: '${username}z')
          .get();

      for (final doc in querySnapshotUsername.docs) {
        final userData = doc.data() as Map<String, dynamic>;
        final userProfile = UserProfile.fromJson(userData);
        userProfiles.add(userProfile);
      }
      for (final doc in querySnapshotFullname.docs) {
        final userData = doc.data() as Map<String, dynamic>;
        final userProfile = UserProfile.fromJson(userData);
        userProfiles.add(userProfile);
      }
    } catch (e) {
      log(e.toString());
    }
    print(userProfiles.map((e) => e.userName).toList());
    return userProfiles;
  }
}
