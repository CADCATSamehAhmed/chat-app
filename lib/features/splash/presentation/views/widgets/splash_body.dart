import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/variables.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

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
          image: AssetImage(Images.logo),
          height: screenWidth * .6,
          width: screenWidth * .6,
        ),
        Text(
          'WhatsUp',
          style: AppFonts.font25.copyWith(color: AppColors.mainColor),
        ),
        SizedBox(height: screenWidth * .4),
        Center(
            child: Text(
          'The best chat app in this century!',
          style: AppFonts.font18,
        )),
      ],
    );
  }
}
