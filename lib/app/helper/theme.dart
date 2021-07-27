import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static const primaryColor = Color(0xffE9E7F2);
  static const accentColor = Color(0xffA9A3C2);
  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);
  static const darkGreyColor = Color(0xFF323232);
  static const yellowColor = Color(0xFFF6CF48);
  static const brokenWhiteColor = Color(0xFFcccccc);
  static const redColor = Color(0xFFee5253);
  static const greenColor = Color(0xFF10ac84);
  static const greyColor = Color(0xFF485460);
  static const transparentColor = Colors.transparent;
  static const disableColor = Color(0xFFbbbbbb);

  static ThemeData lightTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      iconTheme: IconThemeData(color: whiteColor),
      unselectedWidgetColor: whiteColor,
      textTheme: GoogleFonts.playfairDisplayTextTheme(),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        textTheme: GoogleFonts.playfairDisplayTextTheme(),
      ),
    );
  }

  static TextStyle titleStyle = TextStyle(color: blackColor, fontSize: 20.sp);
  static TextStyle listTitleStyle = TextStyle(color: blackColor, fontSize: 14.sp);
  static TextStyle listSubTitleStyle = TextStyle(color: blackColor, fontSize: 12.sp);
}
