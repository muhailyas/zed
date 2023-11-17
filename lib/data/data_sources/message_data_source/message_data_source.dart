import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/repositories/message_repository/message_repository.dart';

class MessageDataSource implements MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<Message>> getChatMessages({required String chatId}) async* {
    final messageCollection = _firestore.collection('messageCollection');
    try {
      final snapshot = await messageCollection
          .doc(chatId)
          .collection('messages')
          .orderBy('time')
          .get();
      if (snapshot.docs.isNotEmpty) {
        yield snapshot.docs
            .map((message) => Message.fromJson(message.data()))
            .toList();
      }
    } catch (e) {
      log('Error getting chat messages: $e');
      yield [];
    }
    yield [];
  }

  @override
  Future<Either<String, bool>> sendMessage(
      {required String chatId, required Message message}) async {
    try {
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
}
