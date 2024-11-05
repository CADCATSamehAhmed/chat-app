import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.sizeOf(context).width;
    screenHeight=MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(Images.logo),
          height: 216.w,
          width: 216.w,
        ),
        Text(
          'WhatsUp',
          style: AppFonts.font25.copyWith(color: AppColors.mainColor),
        ),
        SizedBox(height: 135.h),
        Center(
            child: Text(
          'The best chat app in this century!',
          style: AppFonts.font18,
        )),
      ],
    );
  }
}
