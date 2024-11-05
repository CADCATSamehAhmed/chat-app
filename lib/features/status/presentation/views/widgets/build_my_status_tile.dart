import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_my_status_avatar.dart';

class BuildMyStatusTile extends StatelessWidget {
  const BuildMyStatusTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.mainColor,
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 20).w,
      title: Text(
        'My Status',
        style: AppFonts.font20,
      ),
      subtitle: Text(
        'Tap to add status update',
        style: AppFonts.font18,
      ),
      leading: const BuildMyStatusAvatar(),
    );
  }
}
