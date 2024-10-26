import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

SizedBox buildAuthButton(
    {required BuildContext context,
    bool isRegister = false,
    required void Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.066,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
      ),
      onPressed: onPressed,
      child: Text(
        isRegister ? 'Sign Up' : 'Log In',
        style: AppFonts.font25.copyWith(
          fontSize: 20,
        ),
      ),
    ),
  );
}
