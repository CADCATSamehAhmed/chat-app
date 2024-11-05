import 'package:chat_app/core/shared_widgets/default_floating_button.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingActionButton extends StatelessWidget {
  final int index;

  const HomeFloatingActionButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return DefaultFloatingButton(
        tooltip: 'start new chat',
        onPressed: () {},
        icon: Icons.chat,
      );
    } else if (index == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultFloatingButton(
            heroTag: 'NewTextStatusTag',
            tooltip: 'type text status',
            mini: true,
            onPressed: () {},
            icon: Icons.chat,
          ),
          SizedBox(height: 10.h),
          DefaultFloatingButton(
            tooltip: 'add media status',
            onPressed: () async {},
            backgroundColor: AppColors.mainColor,
            icon: Icons.camera_alt,
          ),
        ],
      );
    } else {
      return DefaultFloatingButton(
        tooltip: 'start call',
        onPressed: () {},
        icon: Icons.add_call,
      );
    }
  }
}
