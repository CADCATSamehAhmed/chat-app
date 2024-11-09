import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: SizedBox(
            height: 5.h,
            child: const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
          ),
        ),
      ),
      body: const ProfileBody(),
    );
  }
}
