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
          return 'Please enter your password';
        }
        final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');
        if (!passwordRegex.hasMatch(value)) {
          return 'Password must be at least 8 characters long, contain a number, an uppercase letter, and a special character';
        }
        return null;
      },
      iconData: Icons.lock,
      obscureText: isObscure,
      onTap: toggleVisibility,
      isSuffix: true,
    );
  }
}
