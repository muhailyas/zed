import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zed/data/data_sources/notification_data_source/notification_data_source.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/data/models/message/message_model.dart';
import 'package:zed/data/repositories/message_repository/message_repository.dart';

class MessageDataSource implements MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<Message>> getChatMessages({required String toId}) {
    final chatId = getChatId(toId: toId);

    return _firestore
        .collection('messageCollection/$chatId/messages')
        .orderBy('time', descending: false)
        .snapshots()
        .map((querySnapshot) {
      List<Message> messages = [];

      for (var doc in querySnapshot.docs) {
        final message = Message.fromJson(doc.data());
        if (message.senderId != FirebaseAuth.instance.currentUser!.uid) {
          // Check if the 'read' field is empty
          if (message.read.isEmpty) {
            // Update the read status of the message
            doc.reference.update({'read': DateTime.now().toIso8601String()});
          }
        }
        messages.add(message);
      }

      return messages;
    });
  }

  Stream<Message?> getLastChatMessage({required String toId}) {
    final chatId = getChatId(toId: toId);

    return _firestore
        .collection('messageCollection/$chatId/messages')
        .orderBy('time', descending: true)
        .limit(1)
        .snapshots()
        .map((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        final lastMessage = Message.fromJson(doc.data());
        return lastMessage;
      } else {
        return null;
      }
    });
  }

  @override
  Future<Either<String, bool>> sendMessage({
    required String toId,
    required Type type,
    required String content,
  }) async {
    try {
      final message = Message(
        content: content,
        time: DateTime.now(),
        senderId: FirebaseAuth.instance.currentUser!.uid,
        type: type,
        read: '',
        toId: toId,
      );
      final lastmessage =
          content.contains(FirebaseAuth.instance.currentUser!.uid)
              ? 'sent image'
              : content;
      final chatId = getChatId(toId: toId);
      _firestore.collection('messageCollection').doc(chatId).set({
        'participants': [toId, FirebaseAuth.instance.currentUser!.uid],
        'lastMessage': lastmessage,
        'lastMessageTime': message.time.toString(),
        'chatId': chatId,
      });
      final reciever = await UserDataSource().getUserByUid(toId);
      final sender = await UserDataSource()
          .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
      final messagesCollection = _firestore
          .collection('messageCollection')
          .doc(chatId)
          .collection('messages')
          .doc();
      await messagesCollection
          .set({...message.toJson(), 'messageId': messagesCollection.id}).then(
              (value) => NotificationDataSource().sendPushNotification(
                    token: reciever!.token,
                    title: sender!.userName,
                    content: content,
                    chatId: chatId,
                    toId: toId,
                  ));
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  static String getChatId({required String toId}) {
    List<String> chatId = [toId, FirebaseAuth.instance.currentUser!.uid];
    // Sort the characters in the joined string
    chatId = chatId.join().split('').toList()..sort();
    log(chatId.join());
    return chatId.join();
  }

  @override
  Stream<List<ChatUser>> getChatUsersStream() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return _firestore
        .collection('messageCollection')
        .where('participants', arrayContainsAny: [userId])
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ChatUser.fromJson(doc.data())).toList());
  }

  @override
  Stream<List<ChatUserWithUserProfile>>
      getChatUserWithUserProfileStream() async* {
    await for (List<ChatUser> chatUsers in getChatUsersStream()) {
      List<ChatUserWithUserProfile> users = [];
      for (var user in chatUsers) {
        final currentUserId = FirebaseAuth.instance.currentUser!.uid;
        final userProfile = await UserDataSource().getUserByUid(
            user.participants[0] == currentUserId
                ? user.participants[1]
                : user.participants[0]);
        users.add(
            ChatUserWithUserProfile(chatUser: user, userProfile: userProfile!));
      }
      log(users.toString());
      yield users;
    }
  }

  Future<String> uploadImageAndGetUrl(
      String imagePath, String folderName) async {
    try {
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child(folderName)
          .child(folderName + FirebaseAuth.instance.currentUser!.uid);
      final UploadTask uploadTask = ref.putFile(File(imagePath));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> sendChatImage(
      {required String imagePath, required String toId}) async {
    final imageUrl = await uploadImageAndGetUrl(imagePath, 'chat images');
    await sendMessage(toId: toId, type: Type.image, content: imageUrl);
  }

  Future<Either<String, bool>> deleteMessage(
      {required String messageId, required String toId}) async {
    final chatId = getChatId(toId: toId);
    try {
      await _firestore
          .collection('messageCollection')
          .doc(chatId)
          .collection('messages')
          .doc(messageId)
          .delete();
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }
}
