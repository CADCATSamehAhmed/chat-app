import 'package:chat_app/features/chat/data/view_model/chat_cubit.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final String receiverId;
  const MessageInput({super.key, required this.receiverId});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  ChatCubit chatCubit = ChatCubit();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
            onPressed: chatCubit.toggleEmojiPicker,
          ),
          Expanded(
            child: TextField(
              controller: chatCubit.messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onTap: () {
                if (chatCubit.isEmojiVisible) {
                  setState(() {
                    chatCubit.isEmojiVisible = false;
                  });
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.teal[800],
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                chatCubit.sendMessage(
                    text: chatCubit.messageController.text.trim(),
                    receiverId: widget.receiverId);
              },
            ),
          ),
        ],
      ),
    );
  }
}
