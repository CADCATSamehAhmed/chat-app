import 'package:chat_app/core/shared_widgets/form_field.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');
    return  defaultTextForm(
      controller: phoneController,
      textInputType: TextInputType.phone,
      label: 'enter your phone',
      onValidate: (String? phone) {
        if (phone!.isEmpty) {
          return 'Please enter your phone number';
        } else if (!phoneRegExp.hasMatch(phone)) {
          return 'Please enter a valid phone number';
        } else{
          return null;
        }
      },
      iconData: Icons.phone_android,
    );
  }
}
