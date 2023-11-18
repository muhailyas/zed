import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, required this.message, required this.isSender})
      : super(key: key);

  final Message message;
  final bool isSender;
  static final DateFormat _dateFormat = DateFormat('h:mm a');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth / 1.4,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: isSender
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                  color: isSender ? secondaryBlue : secondaryDark,
                ),
                child: Text(
                  message.content,
                  style: customFontStyle(size: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                children: [
                  if (!isSender)
                    const Icon(
                      Icons.done_all_rounded,
                      color: secondaryBlue,
                      size: 15,
                    ),
                  if (!isSender) width05,
                  Text(
                    getFormattedDate(message.time),
                    style: customFontStyle(size: 10, color: Colors.white70),
                  ),
                  if (isSender) width05,
                  if (isSender)
                    const Icon(
                      Icons.done_all_rounded,
                      color: secondaryBlue,
                      size: 15,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getFormattedDate(DateTime time) {
    return MessageWidget._dateFormat.format(time);
  }
}
