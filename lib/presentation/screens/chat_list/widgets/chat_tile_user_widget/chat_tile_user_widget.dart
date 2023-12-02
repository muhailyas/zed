import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/presentation/screens/chat/chat_screen.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class ChatUserTileWidget extends StatelessWidget {
  const ChatUserTileWidget({
    super.key,
    required this.data,
  });

  final ChatUserWithUserProfile data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          backgroundImage: CachedNetworkImageProvider(
            data.userProfile.profilePhoto.isEmpty
                ? defaultProfileImage
                : data.userProfile.profilePhoto,
          ),
        ),
        title: Text(
          data.userProfile.fullname,
          style: customFontStyle(size: 18),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.42),
              child: Text(
                data.chatUser.lastMessage,
                style: customFontStyle(size: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            width05,
            if (data.chatUser.lastMessageTime.isNotEmpty)
              Text(
                formatTimeDifference(
                    DateTime.parse(data.chatUser.lastMessageTime)),
                style: customFontStyle(size: 12),
              ),
          ],
        ),
        trailing: StreamBuilder(
            stream: MessageDataSource()
                .getLastChatMessage(toId: data.userProfile.uid!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final message = snapshot.data;
                return message != null &&
                        message.read.isEmpty &&
                        message.senderId !=
                            FirebaseAuth.instance.currentUser!.uid
                    ? const CircleAvatar(
                        radius: 5, backgroundColor: Colors.blue)
                    : const SizedBox();
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
