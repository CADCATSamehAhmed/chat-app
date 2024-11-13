import 'package:chat_app/core/shared_widgets/auth_button.dart';
import 'package:chat_app/core/shared_widgets/custom_divider.dart';
import 'package:chat_app/core/themes/app_styles.dart';
import 'package:chat_app/features/auth/data/model/auth_model.dart';
import 'package:chat_app/features/auth/data/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/data/view_model/auth_states.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in/widgets/auth_footer.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/form_register.dart';

// ignore: must_be_immutable
class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Build register screen
  ///
  /// This method is used to build register screen
  ///
  /// It consist of logo, divider, form register, divider, auth button and auth footer
  ///
  /// It used [buildLogo], [buildCustomDivider], [buildRegisterForm], [buildAuthButton],
  /// and [buildAuthFooter]
  ///
  /// It also used [BouncingScrollPhysics] to make the screen can be scrolled
  ///
  /// You can change the appearance of the screen by changing the value of
  /// [email], [password], [isObscure], [name], and [phone]

  /// ****  c8414f9c-55d2-4172-8a8d-5179ecf6ae1c  ******
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit();
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, AuthStates state) {
        if (state is RegisterFailure) {
          authCubit.showInSnackBar(
            context: context,
            value: state.error,
          );
        }
      },
      bloc: authCubit,
      builder: (context, state) => Padding(
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
                'Register To New Account',
                style: AppStyles.textBoldBlack_25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: buildRegisterForm(
                  context: context,
                  email: authCubit.emailController,
                  password: authCubit.passwordController,
                  name: authCubit.nameControler,
                  phone: authCubit.phoneControler,
                  isObscure: authCubit.isObscure,
                  onTap: authCubit.showPassword,
                  emailValidate: authCubit.emailValidate,
                  passValidate: authCubit.passwordValidate,
                  nameValidate: authCubit.nameValidate,
                  phoneValidate: authCubit.phoneNumberValidate,
                  registerFormKey: authCubit.authFormKey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: (state is AuthLoading)
                    ? const CircularProgressIndicator()
                    : buildAuthButton(
                        context: context,
                        isRegister: true,
                        onPressed: () {
                          if (authCubit.authFormKey.currentState!.validate()) {
                            authCubit.signUp(
                              authModel: AuthModel(
                                email: authCubit.emailController.text,
                                password: authCubit.passwordController.text,
                                name: authCubit.nameControler.text,
                                phone: authCubit.phoneControler.text,
                              ),
                              context: context,
                            );
                            // ignore: use_build_context_synchronously
                          }
                        }),
              ),
              buildAuthFooter(context: context, isRegister: true),
            ],
          ),
        ),
      ),
    );
  }
}
