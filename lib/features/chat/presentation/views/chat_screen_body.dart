import 'package:chat_app/features/chat/data/view_model/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/emoji_picker.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/message_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Column buildChatScreenBody(
    {required String receiverId, required ChatCubit chatCubit}) {
  return Column(
    children: [
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: chatCubit.getMessages(receiverId: receiverId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final messages = snapshot.data?.docs ?? [];

            // Scroll to the bottom when new messages are loaded
            Future.delayed(const Duration(milliseconds: 100), () {
              chatCubit.scrollToBottom();
            });

            return ListView.builder(
              controller: chatCubit.scrollController, // Assign ScrollController
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index].data() as Map<String, dynamic>;
                final isMe =
                    message['senderId'] == chatCubit.auth.currentUser!.uid;

                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.teal[200] : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: isMe
                            ? const Radius.circular(10)
                            : const Radius.circular(0),
                        bottomRight: isMe
                            ? const Radius.circular(0)
                            : const Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            chatCubit.formatTimestamp(message['timestamp']),
                            style: TextStyle(
                              color: isMe ? Colors.white70 : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      const Divider(height: 1),
      MessageInput(
        receiverId: receiverId,
      ),
      if (chatCubit.isEmojiVisible)
        buildEmojiPicker(
          chatCubit: chatCubit,
        ),
    ],
  );
}
