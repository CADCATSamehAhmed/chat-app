import 'package:chat_app/features/Main_Chats/presentation/widgets/view_of_chat.dart';
import 'package:flutter/material.dart';
import '../model/contact_details.dart';

class MainChats extends StatelessWidget {
  const MainChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context,index)=>ViewOfChat(name: contacts[index].name, number: contacts[index].number),
      )
    );
  }
}
