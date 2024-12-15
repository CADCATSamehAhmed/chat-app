import 'package:chat_app/features/chat/data/view_model/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/views/chat_screen_body.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String name;

  const ChatScreen({required this.receiverId, required this.name, super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.teal[800],
      ),
      body: buildChatScreenBody(
        receiverId: widget.receiverId,
        chatCubit: chatCubit,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
