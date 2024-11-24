import 'package:chat_app/features/chat/data/model/contact_details.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/chat_window.dart';
import 'package:flutter/material.dart';


class MainChats extends StatelessWidget {
  const MainChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => ChatWindow(
          name: contacts[index].name, number: contacts[index].number),
    ));
  }
}
