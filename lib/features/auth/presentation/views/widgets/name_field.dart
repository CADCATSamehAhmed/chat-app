import 'package:chat_app/core/shared_widgets/form_field.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return defaultTextForm(
      controller: nameController,
      textInputType: TextInputType.name,
      obscureText: false,
      label: 'enter your name',
      onValidate: (String? name) {
        if (name!.isEmpty) {
          return 'Please enter your name';
        } else {
          return null;
        }
      },
      iconData: Icons.person,
    );
  }
}
