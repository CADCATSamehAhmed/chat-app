import 'dart:developer';

import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/shared_widgets/default_form_field.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
      child: Column(
        children: [
          defaultFormField(
            controller: nameController,
            type: TextInputType.text,
            prefixIcon: Icons.person,
            validate: (value) {
              if (value!.isEmpty) {
                return 'name must not be empty';
              } else if (value.contains('@gmail.com')) {
                return 'name must not contain @gmail.com';
              }
              return null;
            },
            label: 'Enter Your Name',
            hint: 'name',
          ),
          const SizedBox(height: 10),
          defaultFormField(
            controller: emailController,
            type: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            validate: (value) {
              if (value!.isEmpty) {
                return 'email must not be empty';
              }
              return null;
            },
            label: 'Enter Your Email',
            hint: 'email',
          ),
          const SizedBox(height: 10),
          defaultFormField(
            controller: phoneController,
            type: TextInputType.phone,
            prefixIcon: Icons.phone,
            validate: (value) {
              if (value!.isEmpty) {
                return 'phone must not be empty';
              }
              return null;
            },
            label: 'Enter Your Phone',
            hint: 'phone',
          ),
          const SizedBox(height: 10),
          defaultFormField(
            type: TextInputType.visiblePassword,
            controller: passwordController,
            label: 'enter your password',
            hint: 'Password',
            obscureText: isObscure,
            prefixIcon: Icons.lock,
            suffixIcon: isObscure ? Icons.visibility_off : Icons.visibility,
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            validate: (value) {
              if (value!.isEmpty) {
                return 'password is too short';
              } else if (value.length < 6) {
                return 'password is too short';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            height: 60,
            backgroundColor: AppColors.mainColor,
            text: "Sign Up",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                log('valid');
              }
            },
          ),
        ],
      ),
    );
  }
}
