import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/repositories/message_repository/message_repository.dart';
part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final MessageRepository _repository;
  final _messageController = StreamController<List<Message>>.broadcast();
  Stream<List<Message>> get messageStream => _messageController.stream;
  
  ChatBloc(this._repository) : super(const Initial()) {
    on<SendTextMessage>(sendTextMessage);
    on<GetChatMessages>(getChatMessages);
    on<GetChatUsers>(getChatUsers);
  }

  FutureOr<void> sendTextMessage(
      SendTextMessage event, Emitter<ChatState> emit) async {
    await _repository.sendMessage(
        toId: event.toId, type: event.type, content: event.content);
  }

  FutureOr<void> getChatMessages(event, Emitter<ChatState> emit) async {
    emit(const ChatState.initial());
    try {
      _repository.getChatMessages(toId: event.toId).listen((messages) {
        if (messages.isNotEmpty) {
          _messageController.add(messages);
        } else {
          emit(const ChatState.chatIsEmpty());
        }
      });
      await for (final messages in messageStream) {
        emit(ChatState.chatLoaded(messages: messages));
      }
    } catch (e) {
      emit(ChatState.error(error: e.toString()));
    } finally {
      _messageController.close();
    }
  }

  FutureOr<void> getChatUsers(
      GetChatUsers event, Emitter<ChatState> emit) async {
    emit(const ChatState.initial());
    final response = await MessageDataSource()
        .searchChatUserWithUserProfileStream(event.query);
    if (response.isEmpty) {
      emit(const ChatState.chatUsersSearchResultIsEmpty());
    } else {
      emit(ChatState.chatUsersSearchResult(users: response));
    }
  }
}
