import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

Row buildAuthFooter({required BuildContext context, bool isRegister = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        isRegister ? 'Already have an account?' : "Don't have an account?",
        style: AppFonts.font14,
      ),
      SizedBox(width: 15.w),
      InkWell(
        onTap: () {
          isRegister
              ? Navigator.pop(context)
              : Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const SignUpView(),
                  ),
                );
        },
        child: Text(
          isRegister ? 'Login here' : 'Register here',
          style: TextStyle(color: AppColors.mainColor, fontSize: 16.sp),
        ),
      ),
    ],
  );
}
