import 'package:chat_app/core/shared_widgets/form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final VoidCallback toggleVisibility;
  final bool isObscure;

  const PasswordField(
      {super.key,
      required this.passwordController,
      required this.toggleVisibility,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return
      defaultTextForm(
      controller: passwordController,
      textInputType: TextInputType.text,
      label: 'enter your password',
      onValidate: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        }
        // Password must be at least 8 characters long
        else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        // // Password must contain at least one number
        // else if (RegExp(r'[0-9]').hasMatch(value)) {
        //   return 'Password must contain at least one number';
        // }
        // // Password must contain at least one special character
        // else if (RegExp(r'[!@#\$&*~]').hasMatch(value)) {
        //   return 'Password must contain at least one special character';
        // }
        return null;
      },
      iconData: Icons.lock,
      obscureText: isObscure,
      onTap: toggleVisibility,
      isSuffix: true,
    );
  }
}
