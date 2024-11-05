import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle font25 = GoogleFonts.inter(
      color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold);
  static TextStyle font23 = GoogleFonts.inter(
      color: Colors.black, fontSize: 23.sp, fontWeight: FontWeight.w500);
  static TextStyle font20 =
      GoogleFonts.inter(color: Colors.black, fontSize: 20.sp);
  static TextStyle font18 =
      GoogleFonts.inter(color: Colors.black, fontSize: 18.sp);
  static TextStyle font14 =
      GoogleFonts.inter(color: Colors.black, fontSize: 14.sp);
  static TextStyle font12 = GoogleFonts.inter(color: Colors.grey, fontSize: 12.sp);
}
