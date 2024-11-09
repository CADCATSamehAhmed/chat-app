import 'package:chat_app/features/profile/presentation/views/widgets/profile_button.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_name_field.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_phone_number_field.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/text_upper_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:30).h,
        child: Column(
          children: [
            const ProfileImage(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              height: 0.9.h,
              color:Colors.black38,
            ),
            const TextUpperFormField(text: 'Name'),
            const ProfileNameField(),
            SizedBox(
              height: 20.h,
            ),
            const TextUpperFormField(text: 'Phone'),
            const ProfilePhoneNumberField(),
            SizedBox(
              height: 20.h,
            ),
            const ProfileButton(),
          ],
        ),
      ),
    );
  }
}
