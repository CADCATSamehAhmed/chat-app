import 'package:chat_app/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

buildLogo(BuildContext context,{double? width}) {
  return Center(
    child: SvgPicture.asset(
      Images.whatsApp,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
      height: width??180.w,
      width: width??180.w,
    ),
  );
}
