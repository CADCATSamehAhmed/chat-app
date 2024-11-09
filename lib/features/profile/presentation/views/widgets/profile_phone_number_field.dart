import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoneNumberField extends StatelessWidget {
  const ProfilePhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: "011257239"),
      decoration: InputDecoration(
        labelText: 'Phone',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onChanged: (value){
        // update phone number
        /*
          viewModel.updateProfile(
                  viewModel.userProfile.phoneNumber, value);
        * */

      },
    );
  }
}
