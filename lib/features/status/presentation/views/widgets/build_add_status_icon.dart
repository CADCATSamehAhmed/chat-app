import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BuildAddStatusIcon extends StatelessWidget {
  const BuildAddStatusIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          color: AppColors.green,
          width: 2,
        ),
      ),
      child: Center(
        child: IconButton(
          iconSize: 15,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: AppColors.green,
            size: 15,
          ),
        ),
      ),
    );
  }
}
