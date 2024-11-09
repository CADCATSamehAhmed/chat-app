import 'package:chat_app/core/shared_widgets/custom_button.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30,vertical: 10).w,
      child: CustomButton(
        height: 50.h,
        backgroundColor: AppColors.mainColor,
        text: 'Save Profile',
        fontSize: 20.sp,
        textColor: Colors.white,
        iconData: Icons.save,
        onPressed: () {
          // fun to save btn
        },
      ),
    );
  }
}
