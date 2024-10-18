import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Fonts{
  static TextStyle font25 = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold
  );
  static TextStyle font23 = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 23,
    fontWeight: FontWeight.w500
  );
  static TextStyle font20 = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 20,
  );
  static TextStyle font18 = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 18,
  );
  static TextStyle font14 = GoogleFonts.inter(
    color: Colors.black,
    fontSize: 14,
  );
  static TextStyle font12 = GoogleFonts.inter(
    color: Colors.grey,
    fontSize: 12,
  );
}