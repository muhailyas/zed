import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_screen.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Chat Room", style: customFontStyle(size: 25)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              height05,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchFieldWidget(
                      width: screenWidth * 0.8, type: SearchType.chatSearch),
                  Container(
                    height: 50,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        color: primaryColor, borderRadius: radius10),
                    child: Center(
                      child: Text("filter", style: customFontStyle(size: 15)),
                    ),
                  )
                ],
              ),
              height05,
              Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        },
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(defaultProfileImage),
                        ),
                        title: Text(
                          "Muhammed ilyas",
                          style: customFontStyle(size: 18),
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth * 0.42),
                              child: Text(
                                'how\'s going on your project',
                                style: customFontStyle(size: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            width05,
                            Text(
                              '2 h ago',
                              style: customFontStyle(size: 12),
                            ),
                          ],
                        ),
                        trailing: const CircleAvatar(
                            radius: 5, backgroundColor: Colors.blue),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
