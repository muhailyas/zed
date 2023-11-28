import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/notification/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:zed/presentation/screens/chat/chat_screen.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationDataSource {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  final _collection =
      FirebaseFirestore.instance.collection('notificationCollection');

  Future<void> addNotifications(
      {required String toId,
      required String content,
      required String type,
      required String token}) async {
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    final ref = _collection.doc(toId).collection('notifications').doc();
    final NotificationModel notification = NotificationModel(
      notificationId: ref.id,
      toId: toId,
      senderId: senderId,
      time: DateTime.now(),
      content: content,
      type: type,
    );
    await ref.set(notification.toJson());
  }

  static updateToken() async {
    final token = await getPushToken();
    if (token != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'token': token});
    }

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    await FlutterNotificationChannel.registerNotificationChannel(
      description: 'For Showing Notification',
      id: 'chats',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Chats',
    );
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    String chatId = message.data['chatId'] ?? '';
    String toId = message.data['toId'] ?? '';
    if (chatId.isNotEmpty && toId.isNotEmpty) {
      final user = await UserDataSource().getUserByUid(toId);
      if (user != null) {
        navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (context) => ChatScreen(user: user, toId: toId),
        ));
      }
    }
  }

  Future<void> sendPushNotification(
      {required String token,
      required String title,
      required String content,
      String? chatId,
      String? toId}) async {
    await FlutterNotificationChannel.registerNotificationChannel(
      description: 'for show notification',
      id: 'chats',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Chats',
    );
    final data = {
      'to': token,
      'notification': {'title': title, "body": content},
      'data': {'chatId': chatId, 'toId': toId},
    };
    String endPoint = "https://fcm.googleapis.com/fcm/send";
    try {
      final response = await http.post(
        Uri.parse(endPoint),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: notificationAuthToken,
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        log('push notification sent successfully');
      } else {
        log('something went wrong');
      }
    } catch (e) {
      log("Error $e");
    }
  }

  Future<List<NotificationWithUserProfile>> getUserNotifications() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final querySnapshot = await _collection
          .doc(userId)
          .collection('notifications')
          .orderBy('time', descending: true)
          .get();
      final responseData =
          await Future.wait(querySnapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data();
        final notificationData = NotificationModel.fromJson(data);
        final userProfile =
            await UserDataSource().getUserByUid(notificationData.senderId);
        final notificationWithUser = NotificationWithUserProfile(
            notification: notificationData, userProfile: userProfile!);
        return notificationWithUser;
      }).toList());
      return responseData;
    } catch (e) {
      log('Error fetching user notifications: $e');
      return [];
    }
  }

  static Future<String?> getPushToken() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    return token;
  }
}
