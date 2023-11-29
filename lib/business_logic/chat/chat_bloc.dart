import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  }

  FutureOr<void> sendTextMessage(
      SendTextMessage event, Emitter<ChatState> emit) async {
    await _repository.sendMessage(
        toId: event.toId, type: event.type, content: event.content);
  }

  FutureOr<void> getChatMessages(event, Emitter<ChatState> emit)  async{
    emit(const ChatState.initial());
    try {
         _repository.getChatMessages(toId: event.toId).listen((messages) { 
        if(messages.isNotEmpty){
          _messageController.add(messages);
        }else{
          emit(const ChatState.chatIsEmpty());
        }
      });
      await for(final messages in messageStream){
        emit(ChatState.chatLoaded(messages: messages));

      }
    } catch (e) {
      emit(ChatState.error(error: e.toString()));
    }finally{
      _messageController.close();

    }
  }
}
