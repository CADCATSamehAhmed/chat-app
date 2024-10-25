
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilephonenumberFeild extends StatelessWidget {
  const ProfilephonenumberFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: TextEditingController(text: "011257239"),
        decoration: InputDecoration(
          labelText: 'Phone',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: (value){
          // update phone number
          /*
            viewModel.updateProfile(
                    viewModel.userProfile.phoneNumber, value);
          * */

        },
      ),

    );
  }
}
