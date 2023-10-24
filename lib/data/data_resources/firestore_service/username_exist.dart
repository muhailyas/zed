import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  static Future<bool> userIdExist() async {
    final user = FirebaseAuth.instance.currentUser;
    final collection =
        await FirebaseFirestore.instance.collection('users').get();
    final userIds = collection.docs.map((user) {
      return user['uid'];
    }).toList();
    return userIds.contains(user!.uid);
  }

  static Future<bool> userNameExist(String username) async {
    final collection =
        await FirebaseFirestore.instance.collection('users').get();
    final userNames = collection.docs.map((user) {
      return user['username'];
    }).toList();
    return userNames.contains(username);
  }
}
