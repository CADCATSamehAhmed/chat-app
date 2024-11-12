import 'dart:developer';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                Images.logo,
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                'Register To New Account',
                style: AppFonts.font23,
              ),
              const SizedBox(height: 10),
              const SignUpForm(),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                          log('GOTO LOGIN');
                        },
                      text: ' Login here',
                      style: AppFonts.font18.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
