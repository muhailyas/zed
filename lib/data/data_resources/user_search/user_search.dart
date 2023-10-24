import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class UserSearch {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  Future<List<UserProfile>> searchUsersByUsername(String query) async {
    final userProfiles = <UserProfile>[];

    try {
      final querySnapshot =
          await _usersCollection.where('username', isEqualTo: query).get();

      for (final doc in querySnapshot.docs) {
        final userData = doc.data() as Map<String, dynamic>;
        final userProfile = UserProfile.fromJson(userData);
        userProfiles.add(userProfile);
      }
    } catch (e) {
      log(e.toString());
    }

    return userProfiles;
  }
}
