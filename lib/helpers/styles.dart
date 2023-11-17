import 'package:flutter/material.dart';

class StylesHelper {
  static String? family;
  TextStyle pageTitle() {
    return TextStyle(
      fontSize: 24.0,
      color: Colors.white,
      fontFamily: family,
    );
  }

  TextStyle buttonTextStyle(Color color) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: family,
    );
  }

  TextStyle appBarTextStyle(Color color) {
    return TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: family,
    );
  }

  TextStyle textFormFieldTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFB2ADAD),
      fontFamily: family,
    );
  }

  TextStyle listTileTitleTextStyle() {
    return TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: family,
    );
  }

  TextStyle listTileSubtitleTextStyle([Color color = const Color(0xFF5D5B5B)]) {
    // optinal color
    return TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: family,
    );
  }
}
// 
// 8
// 16
// 24
// 32