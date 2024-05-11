import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData basicTheme() {
  TextTheme basicTextTheme() {
    return ThemeData.light()
        .textTheme
        .copyWith(
          titleLarge: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          titleMedium: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w400,
              fontSize: 15),
          titleSmall: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w500,
              fontSize: 14),
          bodyLarge: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w500,
              fontSize: 16),
          bodyMedium: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w400,
              fontSize: 15),
          bodySmall: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w300,
              fontSize: 13),
        )
        .apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
            fontFamily: "ZillaSlab");
  }

  return ThemeData.light().copyWith(
      textTheme: basicTextTheme(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.textColor,
          tertiary: AppColors.extraWhiteColor,
          outline: AppColors.borderColor,
          onError: AppColors.errorColor),
      scaffoldBackgroundColor: AppColors.backGroundColor,
      hintColor: AppColors.hintTextColor,
      errorColor: AppColors.errorColor,
      backgroundColor: AppColors.backGroundColor);
}

ThemeData darkTheme() {
  TextTheme basicTextTheme() {
    return ThemeData.light()
        .textTheme
        .copyWith(
          titleLarge: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          titleMedium: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w400,
              fontSize: 15),
          titleSmall: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w500,
              fontSize: 14),
          bodyLarge: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w500,
              fontSize: 16),
          bodyMedium: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w400,
              fontSize: 15),
          bodySmall: const TextStyle(
              fontFamily: "ZillaSlab",
              fontWeight: FontWeight.w300,
              fontSize: 13),
        )
        .apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
            fontFamily: "ZillaSlab");
  }

  return ThemeData.dark().copyWith(
      textTheme: basicTextTheme(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
          secondary: Colors.white,
          tertiary: const Color.fromRGBO(68, 68, 68, 1),
          outline: AppColors.borderColor,
          onError: AppColors.errorColor),
      scaffoldBackgroundColor: const Color.fromRGBO(51, 51, 51, 1),
      hintColor: AppColors.hintTextColor,
      errorColor: AppColors.errorColor,
      backgroundColor: AppColors.backGroundColor);
}
