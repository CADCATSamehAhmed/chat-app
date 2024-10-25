

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilenameFeild extends StatelessWidget {
  //final TextEditingController profileNameController ;
  const ProfilenameFeild({super.key , });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
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
        )

    );
  }
}
