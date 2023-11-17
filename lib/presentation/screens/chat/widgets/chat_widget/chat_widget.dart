import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.senderId, required this.content});
  final String senderId;
  final String content;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime.now());
    bool isSender = senderId.contains(FirebaseAuth.instance.currentUser!.uid);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth / 1.4,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSender ? secondaryBlue : Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                height005,
                Text(
                  formattedTime,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getFormattedDate(DateTime time) {
  final now = DateTime.now();
  // final difference = now.difference(time);
  final difference = now.difference(DateTime.utc(1944, DateTime.june, 6));

  if (difference.inDays == 0) {
    return 'Today';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else {
    return DateFormat.yMd().format(time);
  }
}
