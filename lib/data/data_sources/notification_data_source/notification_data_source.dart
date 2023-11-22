import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/notification/notification.dart';
import 'package:zed/data/repositories/notification_repository/notification_repository.dart';

class NotificationDataSource extends NotificationRepository {
  final _collection = FirebaseFirestore.instance.collection('notification');

  @override
  Future<void> addNotification({required Notification notification}) async {
    await _collection.doc(notification.userId).set(notification.toJson());
  }

  @override
  Future<List<NotificationWithUserProfile>> getUserNotifications() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final querySnapshot =
          await _collection.where('userId', isEqualTo: userId).get();

      final List<NotificationWithUserProfile> notificationsWithUserProfile =
          await Future.wait(
        querySnapshot.docs.map((doc) async {
          Map<String, dynamic> data = doc.data();
          final notificationData = Notification.fromJson(data);
          final userProfile =
              await UserDataSource().getUserByUid(notificationData.senderId);
          final notificationWithUser = NotificationWithUserProfile(
              notification: notificationData, userProfile: userProfile!);
          return notificationWithUser;
        }),
      );

      return notificationsWithUserProfile;
    } catch (e) {
      log('Error fetching user notifications: $e');
      return [];
    }
  }
}
