import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

Row buildAuthFooter({required BuildContext context, bool isRegister = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(isRegister
          ? 'Already have an account?'
          : '''Dont't have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          isRegister
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),)
              : Navigator.of(context).pop();
        },
        child: Text(
          isRegister ? 'Login here' : 'Register here',
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
      ),
    ],
  );
}
