import 'dart:developer';
import 'package:chat_app/features/chat/data/view_model/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isEmojiVisible = false;

  Future<void> sendMessage({
    required String text,
    required String receiverId,
  }) async {
    if (text.trim().isEmpty) return;

    final currentUser = auth.currentUser;
    if (currentUser == null) return;

    String senderId = currentUser.uid;

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatId = ids.join('_');

    final messageData = {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection('chats')
        .add(messageData);

    final chatSummaryData = {
      'lastMessage': text,
      'lastMessageTime': FieldValue.serverTimestamp(),
      'participants': [senderId, receiverId],
    };

    await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .set(chatSummaryData, SetOptions(merge: true))
        .then((onValue) {
      emit(MessageSentSuccessed());
    }).catchError((onError) {
      log('send message error => ${onError.toString()}');
      emit(MessageSentFailed(onError.toString()));
    });

    messageController.clear();

    // Scroll to the bottom after sending a message
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  Stream<QuerySnapshot> getMessages({required String receiverId}) {
    final currentUser = auth.currentUser;
    if (currentUser == null) return const Stream.empty();

    String senderId = currentUser.uid;

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatId = ids.join('_');

    return FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection('chats')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void toggleEmojiPicker() {
    emit(ChangeStateEmojiVisible());
    isEmojiVisible = !isEmojiVisible;
  }

  // Function to scroll to the last message
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return '';
    DateTime date = timestamp.toDate();
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
