import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/view_model/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetUserName extends StatelessWidget {
  final String chatPartnerId;

  const GetUserName({super.key, required this.chatPartnerId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(chatPartnerId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return BlocProvider(
              create: (context) => ChatCubit(),
              child: BlocConsumer<ChatCubit, ChatState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return InkWell(
                      splashColor: AppColors.mainColor.withOpacity(.5),
                      onTap: () {
                        ChatCubit.get(context)
                            .startNewChat(partnerId: chatPartnerId);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundImage: NetworkImage(data['image']),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: AppFonts.font20,
                                ),
                                Text(
                                  '+20${data['phone']}',
                                  style: AppFonts.font18
                                      .copyWith(color: Colors.black45),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return const Text('Loading');
        }));
  }
}
