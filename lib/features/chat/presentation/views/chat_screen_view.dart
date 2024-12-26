import 'package:chat_app/features/chat/data/model/chat_summary.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/views/chat_screen_body.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final ChatSummary chat;
  const ChatScreen({required this.chat, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatCubit chatCubit = ChatCubit();
  @override
  void dispose() {
    chatCubit.messageController.dispose();
    chatCubit.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String myId = chatCubit.auth.currentUser!.uid;
    String receiverId ='';
    for(var id in widget.chat.participants){
      if (myId != id){
        receiverId = id;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name!),
        backgroundColor: Colors.teal[800],
      ),
      body: buildChatScreenBody(
        receiverId: receiverId,
        chatCubit: chatCubit,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
