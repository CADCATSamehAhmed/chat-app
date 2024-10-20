import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/core/widget/build_auth_button.dart';
import 'package:mini_chat/core/widget/build_auth_footer.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/build_logo.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/widgets/form_sign_in.dart';

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
/*************  ✨ Codeium Command ⭐  *************/
  /// A widget that builds a sign in screen.
  ///
  /// This widget includes a logo, a sign in form, an auth button, and a footer.
  ///
  /// ****  ed3d5ac0-9679-421c-8d7a-4ffefccd243c  ******
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildLogo(context),
            buildCustomDivider(context),
            const Text(
              'Log in to your account',
              style: Fonts.font25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: buildSignInForm(
                context: context,
                email: email,
                password: password,
                isObscure: isObscure,
                onTap: () {
                  isObscure = !isObscure;
                  setState(
                    () {},
                  );
                },
                emailValidate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  } else if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                passValidate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  // Password must be at least 8 characters long
                  else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  // Password must contain at least one number
                  else if (RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one number';
                  }
                  // Password must contain at least one special character
                  else if (RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
                signInFormKey: signInFormKey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: buildAuthButton(
                context: context,
                onPressed: () {
                  if (signInFormKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WhatsView(),
                      ),
                    );
                  }
                },
              ),
            ),
            buildAuthFooter(context: context),
          ],
        ),
      ),
    );
  }
}
