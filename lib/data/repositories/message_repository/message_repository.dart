import 'package:dartz/dartz.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/data/models/message/message_model.dart';

abstract class MessageRepository {
  Stream<List<Message>> getChatMessages({required String toId});
  Future<Either<String, bool>> sendMessage(
      {required String toId, required Type type, required String content});
  Future<List<ChatUserWithUserProfile>> searchChatUserWithUserProfileStream(
      String query);
  Stream<List<ChatUserWithUserProfile>> getChatUserWithUserProfileStream();
  Stream<List<ChatUser>>? getChatUsersStream();
  Future<void> sendChatImage({required String imagePath, required String toId});
}
