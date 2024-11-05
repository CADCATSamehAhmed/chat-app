import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BuildStatusListView extends StatelessWidget {
  final Color? borderColor;
  const BuildStatusListView({
    super.key,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        String dayName = DateFormat('EE').format(DateTime.now());
        String time = DateFormat('jm').format(DateTime.now());
        return ListTile(
          splashColor: AppColors.mainColor,
          onTap: () {},
          contentPadding: const EdgeInsets.symmetric(horizontal: 20).w,
          title: Text(
            'Moffa',
            style: AppFonts.font20,
          ),
          subtitle: Text(
            '$dayName, $time',
            style: AppFonts.font18,
          ),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor ?? AppColors.mainColor,
                width: 2.w,
              ),
            ),
            child: CircleAvatar(
              radius: 25.r,
              backgroundImage: const NetworkImage(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
        );
      },
    );
  }
}
