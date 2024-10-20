import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/auth/presentation/view/register/register.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/sign_in.dart';

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
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                  (route) => false)
              : Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
        },
        child: Text(
          isRegister ? 'Login here' : 'Register here',
          style: const TextStyle(
            color: AppColor.primaryColor,
          ),
        ),
      ),
    ],
  );
}
