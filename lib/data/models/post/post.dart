import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? id;
  String userId;
  String username;
  String profileUrl;
  String caption;
  String imageUrl;
  List likes;
  int commentCount;
  DateTime dateTime;

  Post(
      {this.id,
      required this.userId,
      required this.caption,
      required this.imageUrl,
      required this.likes,
      required this.commentCount,
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
        likes: data['likes'] ?? [],
        commentCount: data['commentCount'] ?? 0,
        profileUrl: data['profileurl'] ?? '',
        username: data['username'] ?? '',
        dateTime: (data['datepublished'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'caption': caption,
      'imageUrl': imageUrl,
      'likes': [],
      'commentCount': commentCount,
      'profileurl': profileUrl,
      'username': username,
      'datepublished': dateTime,
    };
  }
}
