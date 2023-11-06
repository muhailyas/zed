import 'package:zed/data/models/user/user.dart';

abstract class FollowRepository {
  Future<void> followUser({required String uid, required String followId});
  Future<List<UserProfile>> getFollowersList({required String uid});
  Future<List<UserProfile>> getFollowingList({required String uid});
  Future<void> unfollowUser({required String uid, required String followId});
  Future<void> removeFollower(
      {required String uid, required String followerId});
}
