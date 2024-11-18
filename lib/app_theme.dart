import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color backgroundLight = Colors.white;
  // static const Color backgroundDark = Color(0xff060E1E);
  static const Color black = Color(0xff303030);
  static const Color lightBlack = Color(0xff4F5A69);
  static const Color white = Color(0xffffffff);
  static const Color gray = Color(0xffC8C9CB);
  static const Color red = Color(0xffC91C22);
  static const Color blue = Color(0xff003E90);
  static const Color pink = Color(0xffED1E79);
  static const Color brown = Color(0xffCF7E48);
  static const Color yellow = Color(0xffF2D352);
  static const Color lightBlue = Color(0xff4882CF);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
