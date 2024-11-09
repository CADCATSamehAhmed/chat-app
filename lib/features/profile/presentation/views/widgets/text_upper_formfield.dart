import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextUpperFormField extends StatelessWidget {
  final String text;

  const TextUpperFormField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,style: AppFonts.font20,),
      ),
    );
  }
}
