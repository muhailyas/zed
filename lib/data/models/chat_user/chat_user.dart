import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class ChatUser {
  final String chatId;
  final List<String> participants;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChatUser({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      chatId: json['chatId'],
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      lastMessageTime: (json['lastMessageTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    };
  }
}

class ChatUserWithUserProfile {
  final ChatUser chatUser;
  final UserProfile userProfile;
  ChatUserWithUserProfile({required this.chatUser, required this.userProfile});
}
