import 'package:chat_app_team_mentor/core/constants/app_images.dart';
import 'package:chat_app_team_mentor/core/constants/variables.dart';
import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(AppImages.logo),
          height: screenWidth * .6,
          width: screenWidth * .6,
        ),
        Text(
          'WhatsUp',
          style: AppStyles.font25.copyWith(color: AppColors.green),
        ),
        SizedBox(height: screenWidth * .4),
        Center(
            child: Text(
          'The best chat app in this century!',
          style: AppStyles.font18,
        )),
      ],
    );
  }
}
