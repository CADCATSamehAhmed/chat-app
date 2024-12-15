import 'package:chat_app/features/chat/data/view_model/chat_cubit.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

Widget buildEmojiPicker({required ChatCubit chatCubit}) {
  return SizedBox(
    height: 250,
    child: EmojiPicker(
      onEmojiSelected: (category, emoji) {
        chatCubit.messageController.text += emoji.emoji;
      },
    ),
  );
}
