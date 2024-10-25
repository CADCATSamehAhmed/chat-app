import 'package:chat_app/core/themes/colors.dart';
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
        color: Colors.white,
        border: Border.all(
          color: AppColors.mainColor,
          width: 2,
        ),
      ),
      child: Center(
        child: IconButton(
          iconSize: 15,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: AppColors.mainColor,
            size: 15,
          ),
        ),
      ),
    );
  }
}
