import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/chat/data/model/chat_summary.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/chat_window.dart';

class MainChats extends StatelessWidget {
  const MainChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {},
          builder: (context, state) {
            ChatCubit cubit = ChatCubit.get(context);
            return StreamBuilder<List<ChatSummary>>(
              stream: cubit.getChats(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ChatSummary>> snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator(color: AppColors.mainColor,);
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('Something went wrong'));
                } else if (!snapshot.hasData) {
                  return const Center(
                      child: Text('You have not chats yet'));
                }
                List chats = cubit.getChats() as List;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatWindow(chat: chats[index]);
                  },
                );
              },
            );
          },
        ),
      )
    );
  }
}
