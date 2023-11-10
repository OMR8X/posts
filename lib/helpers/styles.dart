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

  TextStyle button() {
    return TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: family,
    );
  }
}
// 
// 8
// 16
// 24
// 32