import 'package:chat_app/features/chat/data/model/chat_summary.dart';
import 'package:chat_app/features/chat/data/model/message_model.dart';
import 'package:chat_app/features/chat/data/repo/chats_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isEmojiVisible = false;
  ChatsRepo chatsRepo = ChatsRepo();

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

    MessageModel messageData = MessageModel(senderId, receiverId, text, FieldValue.serverTimestamp());
    final response =await chatsRepo.sendMessage(chatId, messageData);
    if(response){
      emit(MessageSentSuccessed());
    }else{
      emit(MessageSentFailed(onError.toString()));
    }
    messageController.clear();

    // Scroll to the bottom after sending a message
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  Future<void> startNewChat({
    required String partnerId,
  }) async {
    final currentUser = auth.currentUser;
    if (currentUser == null) return;
    String senderId = currentUser.uid;
    List<String> ids = [senderId, partnerId];
    ids.sort();
    String chatId = ids.join('_');
    final response = await chatsRepo.startChat(chatId, ids);
    if(response){
      emit(MessageSentSuccessed());
    }else{
      emit(MessageSentFailed(onError.toString()));
    }
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

  Stream<List<ChatSummary>> getChats() {
    final currentUser = auth.currentUser;
    if (currentUser == null) return const Stream.empty();
    return chatsRepo.getChats(currentUser.uid);
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
