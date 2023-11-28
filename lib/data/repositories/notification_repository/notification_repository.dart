import 'package:zed/data/models/notification/notification.dart';

abstract class NotificationRepository {
  Future<void> addNotification({required NotificationModel notification});
  Future<List<NotificationWithUserProfile>> getUserNotifications();
}
