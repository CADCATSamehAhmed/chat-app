import 'dart:developer';
import 'package:chat_app/features/chat/data/model/chat_summary.dart';
import 'package:chat_app/features/chat/data/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsRepo {

  Future<Map<String, dynamic>>? getLastMessageData(String chatId) async {
    QuerySnapshot<Map<String, dynamic>> messageSnapshot = await FirebaseFirestore.instance.collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();
    if (messageSnapshot.docs.isNotEmpty) {
      return messageSnapshot.docs.first.data();
    } else {
      return {};
    }
  }

  Stream<List<ChatSummary>> getChats(String uid) {
    List<ChatSummary> chats = [];
    return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      Map<String, Map<String, dynamic>> cachedUserData = {};
      for (var doc in snapshot.docs) {
        String chatPartnerId = doc['chatPartnerId'];
        String chatId = doc['chatId'];
        Map<String, dynamic> otherUserData =
            await getOtherUserData(chatPartnerId);
        cachedUserData[chatPartnerId] = otherUserData;
        final lastMessageData = await getLastMessageData(chatId);
        if (doc.data().isNotEmpty && lastMessageData != null) {
          ChatSummary chatModel = ChatSummary.fromJson(
            doc.data(),
            cachedUserData[chatPartnerId]!['name'],
            cachedUserData[chatPartnerId]!['image'],
            lastMessageData['message'],
            lastMessageData['date'],
          );
          chats.add(chatModel);
        }
      }
      return chats.isNotEmpty ? chats : [];
    });
  }

  Future<void> sendMessage(String chatId,MessageModel message) async {

      await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(message.toMap())
          .then((onValue) {
      }).catchError((onError) {
        log('send message error => ${onError.toString()}');
      });
  }

  Future<Map<String, dynamic>> getOtherUserData(String otherUserId) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
    await FirebaseFirestore.instance.collection('users').doc(otherUserId).get();
    return userSnapshot.data()!;
  }
}
