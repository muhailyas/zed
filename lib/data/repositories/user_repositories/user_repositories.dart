import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/models/user/user.dart';

abstract class UserRepository {
  Future<void> addUser(UserProfile userProfile);
  updateUser(UserProfile profile);
  Future<UserProfile?> getUserByUid(String uid);
  Future<List<Post>> getUserPosts(String uid);
  Future<List<UserProfile>> searchUsersByUsername(String query);
}
