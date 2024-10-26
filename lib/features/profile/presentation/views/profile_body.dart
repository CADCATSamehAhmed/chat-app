import 'package:chat_app/features/profile/presentation/views/widgets/profile_button.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_name_field.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_phone_number_field.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Profileimage(),
            SizedBox(
              height: 20,
            ),
            ProfileNameField(),
            SizedBox(
              height: 20,
            ),
            ProfilePhoneNumberField(),
            SizedBox(
              height: 20,
            ),
            ProfileButton(),
          ],
        ),
      ),
    );
  }
}
