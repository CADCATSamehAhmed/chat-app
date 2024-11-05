import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewOfChat extends StatelessWidget {
  final String name;
  final String number;

  const ViewOfChat({super.key, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.mainColor,
      onTap: (){

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
                        name,
                        style:
                            AppFonts.font20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10).w,
                        child: Text(
                          "12:00 PM",
                          style: AppFonts.font14.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "# $number",
                        style: AppFonts.font18.copyWith(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30).w,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColors.mainColor,
                          child: Text("2",
                              style: AppFonts.font12.copyWith(color: Colors.white)),
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
