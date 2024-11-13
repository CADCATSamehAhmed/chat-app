import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A row of text and an InkWell which displays 'Already have an account?',
/// a small space, and 'Login here'. When the InkWell is tapped, the
/// SignIn screen is pushed onto the navigator.
/// ****  80dede56-eff2-45b4-b234-b16007fabced  ******
Row buildRegisterFooter(BuildContext context) {
  return Row(
    children: [
      const Text('''Already have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        },
        child: Text(
          'Login here',
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
      ),
    ],
  );
}
