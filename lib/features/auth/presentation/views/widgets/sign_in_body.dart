import 'package:chat_app/core/shared_widgets/default_loading.dart';
import 'package:chat_app/features/auth/data/model/auth_model.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/show%20_snak_bar.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const HomeView(),
            ),
          );
        }
        else if(state is SignInFailure){
          showInSnackBar(context: context, value: state.error);
        }
      }, builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
        return Form(
          key: signInFormKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(30).w,
            children: [
              buildLogo(context),
              SizedBox(height: 15.h),
              Text(
                textAlign: TextAlign.center,
                'Log in to your account',
                style: AppFonts.font23,
              ),
              SizedBox(height: 15.h),
              EmailField(emailController: email),
              SizedBox(height: 15.h),
              PasswordField(
                  passwordController: password,
                  toggleVisibility: () {
                    authCubit.showPassword();
                  },
                  isObscure: authCubit.isObscure),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.only(bottom: 30).h,
                child: buildAuthButton(
                  context: context,
                  onPressed: () async {
                    if (signInFormKey.currentState!.validate()) {
                      AuthModel authModel = AuthModel(email: email.text, password: password.text);
                      defaultLoading(
                        context: context,
                        asyncFunction: authCubit.login(
                            authModel: authModel, context: context),
                      );
                    }
                  },
                ),
              ),
              buildAuthFooter(context: context),
            ],
          ),
        );
      }),
    );
  }
}
