import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/repositories/message_repository/message_repository.dart';

class MessageDataSource implements MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessages(
      {required String toId}) {
    final chatId = getChatId(toId: toId);
    return _firestore
        .collection('messageCollection/$chatId/messages')
        .orderBy('time')
        .snapshots();
  }

  @override
  Future<Either<String, bool>> sendMessage(
      {required String toId, required Message message}) async {
    try {
      final chatId = getChatId(toId: toId);
      _firestore.collection('messageCollection').doc(chatId).set({
        'participants': [toId, FirebaseAuth.instance.currentUser!.uid],
        'lastMessage': message.content,
        'lastMessageTime': message.time,
        'chatId': chatId,
      });
      final messagesCollection = _firestore
          .collection('messageCollection')
          .doc(chatId)
          .collection('messages')
          .doc();
      await messagesCollection
          .set({...message.toJson(), 'messageId': messagesCollection.id});
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  static String getChatId({required String toId}) {
    List<String> chatId = [toId, FirebaseAuth.instance.currentUser!.uid];
    // Sort the characters in the joined string
    chatId = chatId.join().split('').toList()..sort();
    log(chatId.join());
    return chatId.join();
  }

  Future<List<ChatUser>> getChatUsers() async {
    final snapshot = await _firestore.collection('messageCollection').where(
        'participants',
        arrayContainsAny: [FirebaseAuth.instance.currentUser!.uid]).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs
          .map((user) => ChatUser.fromJson(user.data()))
          .toList();
    }
    return [];
  }

  Future<List<ChatUserWithUserProfile>> getChatUserWithUserProfile() async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final chatUsers = await getChatUsers();
    List<ChatUserWithUserProfile> users = [];
    if (chatUsers.isNotEmpty) {
      for (var user in chatUsers) {
        final userProfile = await UserDataSource().getUserByUid(
            user.participants[0] == currentUserId
                ? user.participants[1]
                : user.participants[0]);
        users.add(
            ChatUserWithUserProfile(chatUser: user, userProfile: userProfile!));
      }
      return users;
    }
    return [];
  }
}
