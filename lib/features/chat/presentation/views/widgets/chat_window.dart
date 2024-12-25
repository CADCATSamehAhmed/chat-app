import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chat/data/model/chat_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../chat_screen_view.dart';

class ChatWindow extends StatelessWidget {
  final ChatSummary chat;

  const ChatWindow({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.mainColor,
      onTap: () {
        // to navigate to chat screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(chat: chat),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.shade400,
              child: Icon(
                Icons.person,
                size: 25.sp,
              ),
            ),
            SizedBox(width: 15.w),
            SizedBox(
              width: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat.name!,
                        style: AppFonts.font20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10).w,
                        child: Text(
                          '${chat.lastMessageTime}',
                          style: AppFonts.font14.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat.lastMessage!,
                        style: AppFonts.font18.copyWith(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30).w,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColors.mainColor,
                          child: Text("2",
                              style: AppFonts.font12
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
