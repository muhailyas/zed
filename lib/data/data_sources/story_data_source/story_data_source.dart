import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/data/repositories/story_repository/story_repository.dart';

class StoryDataSource implements StoryRepository {
  final _storyCollection = FirebaseFirestore.instance.collection('story');
  @override
  Future<void> addStory({required Story story}) async {
    final storyDoc = _storyCollection.doc();
    await storyDoc.set({...story.toJson(), 'storyId': storyDoc.id});
  }

  @override
  Future<List<Story>> fetchStories({required String userId}) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userId)
        .get();
    List followings = userDoc.docs.first['following'];
    final stories =
        await _storyCollection.where('userId', whereIn: followings).get();
    return stories.docs.map((story) => Story.fromJson(story.data())).toList();
  }

  @override
  Future<void> deleteStroy({required String stroyId}) async {
    await _storyCollection.doc(stroyId).delete();
  }

  @override
  Future<List<File?>> fetchRecentImages() async {
    final result = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      hasAll: true,
    );

    if (result.isNotEmpty) {
      final recentImages =
          await result[0].getAssetListRange(start: 0, end: 30);
      final images = recentImages.map((asset) async {
        final imageData = await asset.file;
        if (imageData != null) {
          return imageData;
        } else {
          return null;
        }
      }).toList();
      final response = await Future.wait(images);
      return response;
    }
    return [];
  }
}
