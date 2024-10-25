import 'dart:developer';

import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/sign_up/presentation/view/widgets/sign_up_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                style: Fonts.font23,
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
                          log('GOTO LOGIN');
                        },
                      text: ' Login here',
                      style: Fonts.font18.copyWith(
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
