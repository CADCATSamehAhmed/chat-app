import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/name_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(30).w,
        children: [
          buildLogo(context,width: 150.w),
          SizedBox(height: 15.h),
          Text(
            'Register To New Account',
            style: AppFonts.font23,
          ),
          SizedBox(height: 15.h),
          NameField(nameController: nameController),
          SizedBox(height: 15.h),
          EmailField(emailController: emailController),
          SizedBox(height: 15.h),
          PhoneField(phoneController: phoneController),
          SizedBox(height: 15.h),
          PasswordField(
              passwordController: passwordController,
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
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          buildAuthFooter(context: context, isRegister: true)
        ],
      ),
    );
  }
}
