import 'package:flutter/material.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/presentation/screens/chat/widgets/chat_tile_widget/chat_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class ChatTileWithGroupTimeHeader extends StatelessWidget {
  const ChatTileWithGroupTimeHeader(
      {super.key,
      required this.today,
      required this.yesterday,
      required this.message});
  final DateTime today;
  final DateTime yesterday;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: radius10,
          color: secondaryDark,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.02, horizontal: screenWidth * 0.02),
            decoration:
                BoxDecoration(borderRadius: radius10, color: secondaryDark),
            child: Text(
              formatGroupTime(message.time, today, yesterday),
              style: customFontStyle(color: Colors.white, size: 14),
            ),
          ),
        ),
        height05,
        // chat tile widget
        ChatTileWidget(message: message),
      ],
    );
  }
}
