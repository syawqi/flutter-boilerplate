import 'package:boilerplate/cores/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainThemeData {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: MainColors.primary,
    textTheme: GoogleFonts.getTextTheme(
      'Roboto',
      TextTheme(
        headline6: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w500,
            color: Colors.orange,
            height: 1.2),
      ),
    ),

    /* light theme settings */
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MainColors.primaryDark,
    textTheme: GoogleFonts.getTextTheme(
      'Roboto',
      TextTheme(
        headline6: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.2),
      ),
    ),
    /* dark theme settings */
  );
}
