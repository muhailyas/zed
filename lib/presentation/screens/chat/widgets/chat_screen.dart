import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_widget/chat_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatInputController = TextEditingController();
  List<ChatWidget> chats = [];
  @override
  Widget build(BuildContext context) {
    print(chats);
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
                  stream: MessageDataSource().getChatMessages(chatId: 'chatId'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return Center(
                            child: Text("Say Hi 👋", style: customFontStyle()));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                              senderId: chats[index].senderId,
                              content: chats[index].content);
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
          backgroundImage: const NetworkImage(defaultProfileImage),
        ),
        width10,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Muhammed ilyas", style: customFontStyle()),
            Text("@ilyas", style: customFontStyle(size: 14)),
          ],
        )
      ],
    );
  }

  Widget _chatInput() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
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
          width05
        ],
      ),
    );
  }

  void sendMessage() {
    if (_chatInputController.text.isNotEmpty) {
      chats.add(ChatWidget(
          senderId: FirebaseAuth.instance.currentUser!.uid,
          content: _chatInputController.text.trim()));
      setState(() {});
      _chatInputController.clear();
    }
  }
}
