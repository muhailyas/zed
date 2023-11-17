import 'package:dartz/dartz.dart';
import 'package:zed/data/models/message/message_model.dart';

abstract class MessageRepository {
  Stream<List<Message>> getChatMessages({required String chatId});
  Future<Either<String, bool>> sendMessage(
      {required String chatId, required Message message});
}
