import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({Key? key, required this.message}) : super(key: key);

  final Message message;

  static final DateFormat _dateFormat = DateFormat('h:mm a');

  @override
  Widget build(BuildContext context) {
    bool isSender = message.senderId == FirebaseAuth.instance.currentUser!.uid;
    return isSender ? _blueMessage(context, isSender) : _darkBlueMessage();
  }

  _blueMessage(BuildContext context, bool isSender) {
    return InkWell(
      onLongPress: () {
        _showBottomSheet(isSender, context, message);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth / 1.4,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      color: secondaryBlue,
                    ),
                    child: message.type == Type.text
                        ? Text(
                            message.content,
                            style: customFontStyle(size: 16),
                            textAlign: TextAlign.left,
                          )
                        : ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                            child: CachedNetworkImage(
                              imageUrl: message.content,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.image, size: 70);
                              },
                            ),
                          )),
                Row(
                  children: [
                    width05,
                    Text(
                      getFormattedDate(message.time),
                      style: customFontStyle(size: 10, color: Colors.white70),
                    ),
                    Icon(
                      Icons.done_all_rounded,
                      color:
                          message.read.isEmpty ? Colors.white70 : secondaryBlue,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _darkBlueMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth / 1.4,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: secondaryDark,
                  ),
                  child: message.type == Type.text
                      ? Text(
                          message.content,
                          style: customFontStyle(size: 16),
                          textAlign: TextAlign.left,
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.05),
                          child: CachedNetworkImage(
                            imageUrl: message.content,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.image, size: 70);
                            },
                          ),
                        )),
              Text(
                getFormattedDate(message.time),
                style: customFontStyle(size: 10, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getFormattedDate(DateTime time) {
    return ChatTileWidget._dateFormat.format(time);
  }

  void _showBottomSheet(bool isSender, BuildContext context, Message message) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListTile(
                onTap: () async {
                  await MessageDataSource()
                      .deleteMessage(
                          messageId: message.messageId!, toId: message.toId)
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
                leading: const Icon(Icons.delete, color: red),
                title: Text("Delete message",
                    style: customFontStyle(size: 16, color: red)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              color: primaryColor,
              child: ListTile(
                leading:
                    const Icon(Icons.done_all_rounded, color: secondaryBlue),
                title: Text("Read",
                    style: customFontStyle(size: 16, color: whiteColor)),
                subtitle: message.read.isEmpty
                    ? null
                    : Text(formatDateTime(message.read),
                        style: customFontStyle(size: 10, color: greyColor)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              color: primaryColor,
              child: ListTile(
                leading: const Icon(Icons.done_all_rounded, color: greyColor),
                title: Text("Sent",
                    style: customFontStyle(size: 16, color: whiteColor)),
                subtitle: Text(formatDateTime(message.time.toIso8601String()),
                    style: customFontStyle(size: 10, color: greyColor)),
              ),
            ),
          ],
        );
      },
    );
  }
}
