import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_tile_widget/chat_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user, required this.toId});
  final String toId;
  final UserProfile user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List list = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
          backgroundColor: primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream:
                      MessageDataSource().getChatMessages(toId: widget.toId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!.docs;
                      list =
                          data.map((e) => Message.fromJson(e.data())).toList();
                      if (list.isEmpty) {
                        return Center(
                            child: Text("Say Hi 👋", style: customFontStyle()));
                      }
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final message = list[index];
                          return ChatTileWidget(
                            message: message,
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            _chatInput(),
            height005,
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: whiteColor)),
        CircleAvatar(
          radius: screenWidth * 0.05,
          backgroundImage: NetworkImage(widget.user.profilePhoto.isEmpty
              ? defaultProfileImage
              : widget.user.profilePhoto),
        ),
        width10,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.fullname, style: customFontStyle()),
            Text("@${widget.user.userName}", style: customFontStyle(size: 14)),
          ],
        )
      ],
    );
  }

  Widget _chatInput() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // input field and button
          Expanded(
            child: Card(
              elevation: 15,
              color: secondaryDarkgrey,
              shape: RoundedRectangleBorder(borderRadius: radius20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // emoji button
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined,
                          color: Colors.white60)),
                  Expanded(
                      child: TextField(
                    controller: _chatInputController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: customFontStyle(size: 16, color: Colors.white60),
                    decoration: InputDecoration(
                        hintText: 'Type something',
                        hintStyle:
                            customFontStyle(size: 16, color: Colors.white60),
                        border: InputBorder.none),
                  )),
                  // Pickimage from gallery button
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.image_outlined,
                          color: Colors.white60)),

                  // Take image from camera button
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white60))
                ],
              ),
            ),
          ),
          // send message button
          InkWell(
            onTap: () {
              sendMessage();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                    color: secondaryDarkgrey, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(Icons.send, color: whiteColor),
                ),
              ),
            ),
          ),
          width05
        ],
      ),
    );
  }

  void sendMessage() {
    if (_chatInputController.text.isNotEmpty) {
      final message = Message(
          content: _chatInputController.text.trim(),
          time: DateTime.now(),
          senderId: FirebaseAuth.instance.currentUser!.uid,
          type: Type.text,
          read: '');
      MessageDataSource().sendMessage(toId: widget.toId, message: message);
      _chatInputController.clear();
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
