part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendTextMessage({
    required String toId,
    required Type type,
    required String content,
  }) = SendTextMessage;
  const factory ChatEvent.sendImage({
    required String imagePath,
    required String toId,
  }) = SendImage;
  const factory ChatEvent.getChatMessages({
    required String toId,
  }) = GetChatMessages;
}
