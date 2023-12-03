import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:zed/data/models/story/story.dart';

abstract class StoryRepository {
  Future<void> addStory({required Story story});
  Future<StoryWithUser?> fetchCurrentUserStories();
  Future<List<StoryWithUser>> fetchFollowingStories({required String userId});
  Future<void> deleteStroy({required String stroyId});
  Future<List<File?>> fetchRecentImages();
  Future<Either<String, List<Story>>> fetchArchivedStroies();
  Future<List<StoryWithUser>> fetchStories() ;
}
