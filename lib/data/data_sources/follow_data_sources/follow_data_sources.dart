import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/follow_repository/follow_repository.dart';

class FollowDataSources extends FollowRepository {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> followUser(
      {required String uid, required String followId}) async {
    try {
      final snap = await usersCollection.doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await usersCollection.doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });
        await usersCollection.doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await usersCollection.doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await usersCollection.doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<UserProfile>> getFollowersList({required String uid}) async {
    final document = await usersCollection.doc(uid).get();
    List<dynamic>? followersData = (document.data()! as dynamic)['followers'];

    if (followersData == null) {
      return [];
    }

    List<Future<DocumentSnapshot>> followersSnapshots = followersData
        .map((userId) => usersCollection.doc(userId).get())
        .toList();

    List<DocumentSnapshot> followers = await Future.wait(followersSnapshots);

    List<UserProfile> followerProfiles = followers
        .map((follower) =>
            UserProfile.fromJson(follower.data() as Map<String, dynamic>))
        .toList();
    return followerProfiles;
  }

  @override
  Future<List<UserProfile>> getFollowingList({required String uid}) async {
    final document = await usersCollection.doc(uid).get();
    List<dynamic>? followingUsersData =
        (document.data()! as dynamic)['following'];
    if (followingUsersData == null) {
      return [];
    }
    List<Future<DocumentSnapshot>> followingUsers = followingUsersData
        .map((userId) => usersCollection.doc(userId).get())
        .toList();
    List<DocumentSnapshot> following = await Future.wait(followingUsers);
    return following
        .map(
            (user) => UserProfile.fromJson(user.data() as Map<String, dynamic>))
        .toList();
  }
}
