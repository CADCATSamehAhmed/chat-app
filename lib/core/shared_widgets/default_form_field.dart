import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  void Function()? onTap,
  IconData? prefixIcon,
  bool obscureText = false,
  IconData? suffixIcon,
  void Function()? suffixPressed,
  required String? label,
  required String? hint,
  Color filledColor = Colors.transparent,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    cursorColor: AppColors.green,
    textAlign: TextAlign.start,
    validator: validate,
    onTap: onTap,
    style: AppStyles.font14,
    decoration: InputDecoration(
      filled: true,
      fillColor: filledColor,
      labelText: label,
      hintText: hint,
      hintStyle: AppStyles.font18.copyWith(color: Colors.grey.shade600),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon),
              onPressed: suffixPressed,
            )
          : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.green, width: 1.5),
      ),
    ),
  );
}
