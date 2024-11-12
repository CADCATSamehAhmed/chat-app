import 'package:chat_app/core/constants/variables.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(screenWidth * .02),
        height: height??screenWidth * .25,
        width: width??screenWidth * .25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??screenWidth * .05),
          color: backgroundColor??AppColors.mainColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}