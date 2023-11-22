import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_tile_widget/chat_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/image_picker/image_picker.dart';

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
  bool emojiOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (emojiOpened) {
              setState(() => emojiOpened = !emojiOpened);
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
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
                height05,
                Expanded(
                  child: StreamBuilder<List<Message>>(
                    stream:
                        MessageDataSource().getChatMessages(toId: widget.toId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data!;
                        if (messages.isEmpty) {
                          return Center(
                            child: Text("Say Hi 👋", style: customFontStyle()),
                          );
                        }
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            return ChatTileWidget(
                              message: message,
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}",
                              style: customFontStyle(color: Colors.red)),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                _chatInput(),
                height005,

                // add here
                if (emojiOpened)
                  SizedBox(
                    height: screenHeight * 0.35,
                    child: EmojiPicker(
                      textEditingController: _chatInputController,
                      config: Config(
                          bgColor: primaryColor,
                          columns: 7,
                          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1),
                          noRecents:
                              Text("No Recents", style: customFontStyle())),
                    ),
                  ),
              ],
            ),
          ),
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
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded, color: whiteColor)),
            ],
          ),
        ),
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
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() => emojiOpened = !emojiOpened);
                      },
                      icon: const Icon(Icons.emoji_emotions_outlined,
                          color: Colors.white60)),
                  Expanded(
                      child: TextField(
                    controller: _chatInputController,
                    maxLines: null,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (emojiOpened) {
                        setState(() => emojiOpened = !emojiOpened);
                      }
                    },
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
                      onPressed: () async {
                        final image = await ImagePickerProvider()
                            .pickImage(ImageSource.gallery);
                        if (image != null) {
                          await MessageDataSource().sendChatImage(
                              imagePath: image, toId: widget.toId);
                        }
                      },
                      icon: const Icon(Icons.image_outlined,
                          color: Colors.white60)),

                  // Take image from camera button
                  IconButton(
                      onPressed: () async {
                        final image = await ImagePickerProvider()
                            .pickImage(ImageSource.camera);
                        if (image != null) {
                          await MessageDataSource().sendChatImage(
                              imagePath: image, toId: widget.toId);
                        }
                      },
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
      MessageDataSource().sendMessage(
          toId: widget.toId,
          content: _chatInputController.text.trim(),
          type: Type.text);
      _chatInputController.clear();
      _scrollController.animateTo(
          curve: Curves.bounceIn,
          duration: const Duration(seconds: 2),
          _scrollController.position.maxScrollExtent);
    }
  }
}
