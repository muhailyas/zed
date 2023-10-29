import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class Comment {
  final String? id;
  final String postId;
  final String userId;
  final String text;
  final DateTime dateTime;
  final List<String> likedBy;

  Comment(
      {this.id,
      required this.postId,
      required this.userId,
      required this.text,
      required this.dateTime,
      required this.likedBy});

  factory Comment.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final likedBy = List<String>.from(data['likedBy'] ?? []);
    return Comment(
      id: snapshot.id,
      postId: data['postId'] ?? '',
      userId: data['userId'] ?? '',
      text: data['text'] ?? '',
      dateTime: (data['commentpublished'] as Timestamp).toDate(),
      likedBy: likedBy,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'text': text,
      'commentpublished': dateTime,
      'likedBy': likedBy
    };
  }
}

class CommentWithUserProfile {
  final Comment comment;
  final UserProfile userProfile;
  CommentWithUserProfile({required this.comment, required this.userProfile});

  factory CommentWithUserProfile.fromJson(Map<String, dynamic> json) {
    return CommentWithUserProfile(
        comment: json['comment'], userProfile: json['userprofile']);
  }
}
