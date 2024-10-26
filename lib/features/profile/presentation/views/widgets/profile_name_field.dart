import 'package:flutter/material.dart';

class ProfileNameField extends StatelessWidget {
  //final TextEditingController profileNameController ;
  const ProfileNameField({super.key , });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: "Marwan Ali") ,
      decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
      onChanged: (value){
        /* change of update profile
      * viewModel.updateProfile(
                value, viewModel.userProfile.phoneNumber);*/
      },
    );
  }
}
