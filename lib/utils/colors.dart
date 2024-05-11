import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF134649);
  static const secondaryColor = Color.fromRGBO(156, 156, 156, 1);
  static const tertiaryColor = Color.fromRGBO(255, 194, 37, 1);
  static const colorRed = Color.fromRGBO(220, 20, 60, 1);
  static const borderColor = Color(0xFFDADCE0);
  static const textColorAccent = Color(0xFFFFFFFF);
  static const hintTextColor = Color(0xFF7D7D7D);
  static const errorColor = Color(0XFFC1272D);
  static const extraWhiteColor = Color.fromARGB(255, 255, 255, 255);
  static final shimmerBase = Colors.grey.withOpacity(0.40);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);

  static const Color backGroundColor = Color(0xFFF8F9FA);
  static const Color lGrey = Color(0xFFD9D9D9);
  static const Color textColor = Color(0xFF000000);
  static const Color secondaryTextColor = Color(0xFFAAAAAA);
  static Color shadowColor = Colors.black.withOpacity(0.1);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
