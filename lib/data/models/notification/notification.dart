import 'package:zed/data/models/user/user.dart';

enum NotificationType { like, follow }

class Notification {
  String userId;
  NotificationType type;
  String senderId;
  DateTime time;
  Notification({
    required this.userId,
    required this.type,
    required this.senderId,
    required this.time,
  });
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
        userId: json['userId'],
        type: json['type'] == NotificationType.follow.name
            ? NotificationType.follow
            : NotificationType.like,
        senderId: json['senderId'],
        time: json['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'type': type.name,
      'senderId': senderId,
      'time': time,
    };
  }
}

class NotificationWithUserProfile {
  final Notification notification;
  final UserProfile userProfile;
  NotificationWithUserProfile(
      {required this.notification, required this.userProfile});
}
