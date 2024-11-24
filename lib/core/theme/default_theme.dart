import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.beige,
      titleTextStyle: TextStyle(
          color: AppColors.lightThemeText, fontWeight: FontWeight.w600),
      centerTitle: true,
    ),
    textTheme: const TextTheme(),
  );
}
