import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/colors.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class ScaffoldHelper {
  final GlobalKey<NavigatorState> key;
  ScaffoldHelper(this.key);

  void showSnackBar(Widget content, {Duration? duration, Color? background}) {
    if (key.currentContext != null) {
      _clearSnackBars();
      ScaffoldMessenger.of(key.currentContext!).showSnackBar(
        SnackBar(
          content: content,
          duration: duration ?? const Duration(seconds: 4),
          backgroundColor: background ?? AppColors.grey,
          margin: const EdgeInsets.symmetric(
              horizontal: DesignTokens.screenHorizontalPadding),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
      );
    }
  }

  void _clearSnackBars() {
    ScaffoldMessenger.of(key.currentContext!).clearSnackBars();
  }
}
