part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = Initial;
  const factory ChatState.chatLoaded({
    required List<Message> messages,
  }) = ChatLoaded;
  const factory ChatState.chatIsEmpty() = ChatIsEmpty;
  const factory ChatState.error({required String error}) = Error;
  const factory ChatState.chatUsersSearchResult({
    required List<ChatUserWithUserProfile> users,
  }) = ChatUsersSearchResult;
  const factory ChatState.chatUsersSearchResultIsEmpty()=SearchResultIsEmpty;
}
