import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const styleBlack30 = TextStyle(
    fontSize: 30,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
  );

  static const styleBlack20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle styleBlack18 = TextStyle(
    fontSize: 18,
    color: AppColors.black.withOpacity(0.3),
    fontWeight: FontWeight.bold,
  );
}
