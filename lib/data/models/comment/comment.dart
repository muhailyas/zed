import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String? id;
  final String postId;
  final String userId;
  final String text;
  final Timestamp timestamp;

  Comment({
    this.id,
    required this.postId,
    required this.userId,
    required this.text,
    required this.timestamp,
  });

  factory Comment.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Comment(
      id: snapshot.id,
      postId: data['postId'] ?? '',
      userId: data['userId'] ?? '',
      text: data['text'] ?? '',
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'text': text,
      'timestamp': timestamp,
    };
  }
}
