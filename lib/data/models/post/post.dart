import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? id;
  String userId;
  String caption;
  String imageUrl;
  int likes;
  int commentCount;
  int views;

  Post({
    this.id,
    required this.userId,
    required this.caption,
    required this.imageUrl,
    required this.likes,
    required this.commentCount,
    required this.views,
  });

  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Post(
      id: snapshot.id,
      userId: data['userId'] ?? '',
      caption: data['caption'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      likes: data['likes'] ?? '',
      commentCount: data['commentCount'] ?? 0,
      views: data['views'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'caption': caption,
      'imageUrl': imageUrl,
      'likes': likes,
      'commentCount': commentCount,
      'views': views,
    };
  }
}
