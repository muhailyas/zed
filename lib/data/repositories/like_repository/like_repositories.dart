import 'package:zed/data/models/post/post.dart';

abstract class LikeRepository {
  Future<void> toggleLike({required Post post, required String userId});
}
