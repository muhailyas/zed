import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          children: [_chatInput()],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: whiteColor)),
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(defaultProfileImage),
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
    return Row(
      children: [
        // input field and button
        Expanded(
          child: Card(
            color: secondaryBlue,
            shape: RoundedRectangleBorder(borderRadius: radius20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // emoji button
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
                Expanded(
                    child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Type something',
                      hintStyle: customFontStyle(color: Colors.black, size: 16),
                      border: InputBorder.none),
                )),
                // Pickimage from gallery button
                IconButton(onPressed: () {}, icon: const Icon(Icons.image)),

                // Take image from camera button
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded))
              ],
            ),
          ),
        ),
        width05,
        // send message button
        Container(
          height: 45,
          width: 45,
          decoration:
              const BoxDecoration(color: secondaryBlue, shape: BoxShape.circle),
          child: const Center(
            child: Icon(Icons.send),
          ),
        ),
        width05
      ],
    );
  }
}
