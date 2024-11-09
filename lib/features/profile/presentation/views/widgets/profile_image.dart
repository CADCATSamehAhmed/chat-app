import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60.r,
          backgroundImage: const AssetImage(Images.profile),
        ),
        GestureDetector(
          onTap: () {
            // add function
          },
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: AppColors.mainColor,
            child: Icon(
              Icons.edit,
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
