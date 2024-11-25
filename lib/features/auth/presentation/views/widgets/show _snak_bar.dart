import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showInSnackBar({required BuildContext context, required String value}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.grey.withOpacity(.5),
    elevation: 3,
    margin: EdgeInsets.all(30.w),
    padding: EdgeInsets.all(10.w),
    content: Text(value,style: AppFonts.font18.copyWith(color: Colors.black),),
    duration: const Duration(seconds: 3), // تحديد مدة عرض الـSnackBar
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}