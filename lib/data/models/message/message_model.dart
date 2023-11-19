import 'package:cloud_firestore/cloud_firestore.dart';

enum Type { text, image }

class Message {
  final String? messageId;
  final String content;
  final DateTime time;
  final String senderId;
  final Type type;
  final String read;
  final String toId;
  Message(
      {this.messageId,
      required this.content,
      required this.time,
      required this.senderId,
      required this.type,
      required this.read,
      required this.toId});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'] ?? '',
      content: json['content'] ?? '',
      time: (json['time'] as Timestamp).toDate(),
      senderId: json['senderId'] ?? '',
      type: json['type'] == Type.text ? Type.text : Type.image,
      read: json['read'] ?? '',
      toId: json['toId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'time': time,
      'senderId': senderId,
      'type': type.name,
      'read': read,
      'toId': toId
    };
  }
}
