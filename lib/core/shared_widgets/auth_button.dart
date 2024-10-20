import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/features/whats/presentation/views/whats_view.dart';

SizedBox buildAuthButton(
    {required BuildContext context, bool isRegister = false}) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.066,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
      ),
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const WhatsView(),
        //   ),
        // );
      },
      child: Text(
        isRegister ? 'Sign Up' : 'Log In',
        style: Fonts.font25.copyWith(
          fontSize: 20,
        ),
      ),
    ),
  );
}
