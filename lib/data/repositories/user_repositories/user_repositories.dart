import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/user/user.dart';

class UserRepository {
  static Future addUser(UserProfile profile) async {
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

  updateUser(UserProfile profile) {}

  Future<UserProfile?> getUserByUid(String uid) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final result = await collection.where('uid', isEqualTo: uid).get();
    if (result.docs.isNotEmpty) {
      final data = result.docs.first.data() as Map<String, dynamic>;
      final UserProfile userProfile = UserProfile.fromJson(data);
      return userProfile;
    }
    return null;
  }
}
