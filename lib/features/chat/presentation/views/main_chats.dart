import 'package:chat_app/features/Main_Chats/data/model/contact_details.dart';
import 'package:flutter/material.dart';

import 'widgets/view_of_chat.dart';

class MainChats extends StatelessWidget {
  const MainChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => ViewOfChat(
          name: contacts[index].name, number: contacts[index].number),
    ));
  }
}
