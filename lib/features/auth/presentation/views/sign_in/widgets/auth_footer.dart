import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/presentation/views/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

Row buildAuthFooter({required BuildContext context, bool isRegister = true}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(isRegister ? 'Already have an account?' : "Don't have an account?"),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          isRegister
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpView(),
                  ),
                )
              : Navigator.of(context).pop();
        },
        child: Text(
          isRegister ? 'Register here' : 'Login here',
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
      ),
    ],
  );
}
