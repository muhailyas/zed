import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_screen.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

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
                child: FutureBuilder(
                    future: MessageDataSource().getChatUserWithUserProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                                user: data.userProfile,
                                                toId: data.userProfile.uid!,
                                              )));
                                },
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      data.userProfile.profilePhoto.isEmpty
                                          ? defaultProfileImage
                                          : data.userProfile.profilePhoto),
                                ),
                                title: Text(
                                  data.userProfile.fullname,
                                  style: customFontStyle(size: 18),
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: screenWidth * 0.42),
                                      child: Text(
                                        data.chatUser.lastMessage,
                                        style: customFontStyle(size: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    width05,
                                    Text(
                                      formatTimeDifference(
                                          data.chatUser.lastMessageTime),
                                      style: customFontStyle(size: 12),
                                    ),
                                  ],
                                ),
                                trailing: const CircleAvatar(
                                    radius: 5, backgroundColor: Colors.blue),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
