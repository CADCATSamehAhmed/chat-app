import 'package:chat_app/core/shared_widgets/default_loading.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/model/auth_model.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/name_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/show%20_snak_bar.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const HomeView(),
            ),
          );
        } else if (state is RegisterFailure) {
          showInSnackBar(context: context, value: state.error);
        }
      }, builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
        return Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(30).w,
            children: [
              buildLogo(context, width: 150.w),
              SizedBox(height: 15.h),
              Text(
                textAlign: TextAlign.center,
                'Register To New Account',
                style: AppFonts.font23,
              ),
              SizedBox(height: 15.h),
              NameField(nameController: name),
              SizedBox(height: 15.h),
              EmailField(emailController: email),
              SizedBox(height: 15.h),
              PhoneField(phoneController: phone),
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
                  isRegister: true,
                  context: context,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      AuthModel authModel = AuthModel(
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                          password: password.text);
                      defaultLoading(
                          context: context,
                          asyncFunction: authCubit.signUp(
                              authModel: authModel, context: context));
                    }
                  },
                ),
              ),
              buildAuthFooter(context: context, isRegister: true)
            ],
          ),
        );
      }),
    );
  }
}
