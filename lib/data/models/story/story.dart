import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class Story {
  String? stroyId;
  String userId;
  String imageUrl;
  DateTime time;
  bool isFullView;
  Story(
      {this.stroyId,
      required this.userId,
      required this.imageUrl,
      required this.time,
      required this.isFullView});
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      stroyId: json['storyId'] ?? '',
      userId: json['userId'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      time: (json['time'] as Timestamp).toDate(),
      isFullView: json['isFullView'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'imageUrl': imageUrl,
      'time': time,
      'isFullView': isFullView,
    };
  }
}

class StoryWithUser {
  final List<Story> stories;
  final UserProfile userProfile;
  StoryWithUser({required this.stories, required this.userProfile});
}
