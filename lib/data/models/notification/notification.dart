import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zed/data/models/user/user.dart';

class NotificationModel {
  String? notificationId;
  String toId;
  String senderId;
  String content;
  DateTime time;
  String? type;
  NotificationModel(
      {this.notificationId,
      this.type,
      required this.toId,
      required this.senderId,
      required this.time,
      required this.content});
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notificationId: json['notificationId'] ?? '',
        toId: json['toId'],
        content: json['status'],
        senderId: json['senderId'],
        time: (json['time'] as Timestamp).toDate(),
        type: json['type'] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      'toId': toId,
      'status': content,
      'senderId': senderId,
      'time': time,
      'type': type,
    };
  }
}

class NotificationWithUserProfile {
  final NotificationModel notification;
  final UserProfile userProfile;
  NotificationWithUserProfile(
      {required this.notification, required this.userProfile});
}
