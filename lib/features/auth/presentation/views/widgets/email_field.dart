import 'package:chat_app/core/shared_widgets/form_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'^\w+@gmail\.com$');
    return defaultTextForm(
      controller: emailController,
      textInputType: TextInputType.emailAddress,
      label: 'enter your email',
      onValidate: (String? email) {
        if (email!.isEmpty) {
          return 'email must not be empty';
        } else if (!regex.hasMatch(email)) {
          return 'Please enter a valid email address';
        } else{
          return null;
        }
      },
      iconData: Icons.email,
    );
  }
}