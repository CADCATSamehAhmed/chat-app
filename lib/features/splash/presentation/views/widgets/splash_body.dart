import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLogo(context,width: 216.w,),
        SizedBox(height: 30.h),
        Text(
          'WhatsUp',
          style: AppFonts.font25.copyWith(color: AppColors.mainColor),
        ),
        SizedBox(height: 120.h),
        Center(
            child: Text(
          'The best chat app in this century!',
          style: AppFonts.font18,
        )),
      ],
    );
  }
}
