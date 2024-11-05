import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final bool mini;
  final String? heroTag;
  final String? tooltip;

  const DefaultFloatingButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.borderRadius,
    required this.onPressed,
    this.height,
    this.width,
    this.mini=false,
    this.heroTag,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag??'FloatingActionButtonHeroTag',
      tooltip: tooltip??'FloatingActionButtonTooltip',
      mini: mini,
      onPressed: onPressed,
      backgroundColor: backgroundColor??AppColors.mainColor,
      child: Container(
        padding: const EdgeInsets.all(10).w,
        height: height??90.w,
        width: width??90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??30.r),
          color: backgroundColor??AppColors.mainColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: mini?20.sp:30.sp,
          ),
        ),
      ),
    );
  }
}