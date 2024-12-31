import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/home/presentation/views/widgets/get_user_name.dart';
import 'package:flutter/material.dart';

class StartNewChat extends StatelessWidget {
  final List<String> users;
  const StartNewChat({super.key, required this.users});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('start New Chat',style: AppFonts.font20,),),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GetUserName(chatPartnerId: users[index]);
          }),
    );
  }
}
