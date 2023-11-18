import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:zed/data/models/message/message_model.dart';

abstract class MessageRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessages(
      {required String toId});
  Future<Either<String, bool>> sendMessage(
      {required String toId, required Message message});
}
