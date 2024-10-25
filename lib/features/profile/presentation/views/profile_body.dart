import 'package:chat_app/features/profile/presentation/views/widgets/ProfilePhoneNumber_feild.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profileName_feild.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_button.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';

import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.green[400],

        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Profileimage(),
              SizedBox(height: 20,),
              const ProfilenameFeild(),
              SizedBox(height: 20,),
              const ProfilephonenumberFeild(),
              SizedBox(height: 20,),
              const ProfileButton(),



            ],
          ),),
      ),
    );
  }
}
