import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? id;
  String userId;
  String username;
  String profileUrl;
  String caption;
  String imageUrl;
  int likes;
  int commentCount;
  int views;
  DateTime dateTime;

  Post(
      {this.id,
      required this.userId,
      required this.caption,
      required this.imageUrl,
      required this.likes,
      required this.commentCount,
      required this.views,
      required this.profileUrl,
      required this.username,
      required this.dateTime});

  factory Post.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Post(
        id: snapshot.id,
        userId: data['userId'] ?? '',
        caption: data['caption'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        likes: data['likes'] ?? 0,
        commentCount: data['commentCount'] ?? 0,
        views: data['views'] ?? 0,
        profileUrl: data['profileurl'] ?? '',
        username: data['username'] ?? '',
        dateTime: (data['datepublished'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'caption': caption,
      'imageUrl': imageUrl,
      'likes': likes,
      'commentCount': commentCount,
      'views': views,
      'profileurl': profileUrl,
      'username': username,
      'datepublished': dateTime,
    };
  }
}
