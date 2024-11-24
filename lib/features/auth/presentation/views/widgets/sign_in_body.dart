import 'package:chat_app/core/themes/styles.dart';
import 'auth_footer.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInFormKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(30).w,
        children: [
          buildLogo(context),
          SizedBox(height: 15.h),
          Text(
            'Log in to your account',
            style: AppFonts.font23,
          ),
          SizedBox(height: 15.h),
          EmailField(emailController: email),
          SizedBox(height: 15.h),
          PasswordField(
              passwordController: password,
              toggleVisibility: () {
                isObscure = !isObscure;
                setState(
                  () {},
                );
              },
              isObscure: isObscure),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(bottom: 30).h,
            child: buildAuthButton(
              context: context,
              onPressed: () {
                if (signInFormKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const HomeView(),
                    ),
                  );
                }
              },
            ),
          ),
          buildAuthFooter(context: context),
        ],
      ),
    );
  }
}
