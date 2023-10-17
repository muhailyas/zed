import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class UserRepository {
  addUser(UserProfile profile) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final DocumentReference userProfile = collection.doc();
    final Map<String, dynamic> userData = {
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
}
