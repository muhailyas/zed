import 'package:zed/data/models/notification/notification.dart';

abstract class NotificationRepository {
  Future<void> addNotification({required Notification notification});
  Future<List<NotificationWithUserProfile>> getUserNotifications();
}
