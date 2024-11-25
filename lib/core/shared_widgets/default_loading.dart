import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> defaultLoading({
  Color? color,
  required BuildContext context,
  required Future<dynamic> asyncFunction,
}) async {
  // Show the loading dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ),
      );
    },
  );
  try {
    await asyncFunction;
  } finally {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
