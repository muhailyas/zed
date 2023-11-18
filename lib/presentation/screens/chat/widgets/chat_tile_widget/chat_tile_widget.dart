import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/presentation/screens/chat/widgets/message_widget/message_widget.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    bool isSender =
        message.senderId.contains(FirebaseAuth.instance.currentUser!.uid);
    return MessageWidget(message: message, isSender: isSender);
  }
}
