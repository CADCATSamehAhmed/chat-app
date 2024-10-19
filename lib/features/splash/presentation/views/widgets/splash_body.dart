
import 'package:chat_app_team_mentor/core/constants/images.dart';
import 'package:chat_app_team_mentor/core/constants/variables.dart';
import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/core/themes/colors.dart';
import 'package:chat_app_team_mentor/core/themes/styles.dart';
import 'package:flutter/material.dart';



class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          style: Fonts.font25.copyWith(color: AColors.mainColor),
        ),
        SizedBox(height: screenWidth * .4),
        Center(
            child: Text(
          'The best chat app in this century!',
          style: Fonts.font18,
        )),
      ],
    );
  }
}
