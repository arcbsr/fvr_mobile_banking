import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: const Color(0xFF6F45E9),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.nunitoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF191919),
          iconTheme: IconThemeData(color: Color(0xFF191919)),
          elevation: 0,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6F45E9),
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
      );
}

class AppTextStyles {

  static TextStyle get extraHeader => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w800,
        fontSize: 24.sp,
        color: const Color(0xFF191919),
      );
  static TextStyle get header => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        color: const Color(0xFF191919),
      );
  static TextStyle get title => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: const Color(0xFF191919),
      );
  static TextStyle get body => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: const Color(0xFF191919),
      );
  static TextStyle get caption => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
        color: const Color(0xFF191919),
      );
  static TextStyle get button => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: Colors.white,
      );
} 