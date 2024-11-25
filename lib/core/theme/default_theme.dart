import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.beige,
      titleTextStyle: TextStyle(
        color: AppColors.lightThemeText,
      ),
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.lightThemeText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightThemeText,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightThemeText,
        fontSize: 11,
      ),
      bodyLarge: TextStyle(
        color: AppColors.lightThemeText,
        fontSize: 16,
      ),
    ),
  );
}
