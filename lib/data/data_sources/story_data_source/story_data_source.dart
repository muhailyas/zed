import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
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
  Future<StoryWithUser?> fetchCurrecntUserStories() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final stories =
        await _storyCollection.where('userId', isEqualTo: userId).get();
    if (stories.docs.isNotEmpty) {
      final storiesData =
          stories.docs.map((story) => Story.fromJson(story.data())).toList();
      final userData = await UserDataSource().getUserByUid(userId);
      return StoryWithUser(stories: storiesData, userProfile: userData!);
    } else {
      return null;
    }
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
      final recentImages = await result[0].getAssetListRange(start: 0, end: 30);
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

  @override
  Future<List<StoryWithUser>> fetchStroyWithUser(
      {required String userId}) async {
    List<StoryWithUser> storiesWithUser = [];
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userId)
        .get();
    List followings = userDoc.docs.first['following'];
    for (var user in followings) {
      final userData = await UserDataSource().getUserByUid(user);
      final stories =
          await _storyCollection.where('userId', isEqualTo: user).get();
      if (stories.docs.isNotEmpty) {
        final storiesData = stories.docs.map((story) {
          return Story.fromJson(story.data());
        }).toList();
        final storyWithUser =
            StoryWithUser(stories: storiesData, userProfile: userData!);
        storiesWithUser.add(storyWithUser);
      }
    }
    return storiesWithUser;
  }

  Future<List<StoryWithUser>> fetchStories() async {
    StoryWithUser? currentUserStories = await fetchCurrecntUserStories();
    List<StoryWithUser> followingStories = await fetchStroyWithUser(
      userId: FirebaseAuth.instance.currentUser!.uid,
    );
    List<StoryWithUser> allStories = [];
    if (currentUserStories != null && currentUserStories.stories.isNotEmpty) {
      allStories.add(currentUserStories);
    } else {
      final userProfile = await UserDataSource()
          .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
      allStories.add(StoryWithUser(stories: [], userProfile: userProfile!));
    }
    allStories.addAll(followingStories);
    return allStories;
  }
}
