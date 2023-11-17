import 'dart:io';

import 'package:zed/data/models/story/story.dart';

abstract class StoryRepository {
  Future<void> addStory({required Story story});
  Future<StoryWithUser?> fetchCurrecntUserStories();
  Future<List<StoryWithUser>> fetchStroyWithUser({required String userId});
  Future<void> deleteStroy({required String stroyId});
  Future<List<File?>> fetchRecentImages();
}
