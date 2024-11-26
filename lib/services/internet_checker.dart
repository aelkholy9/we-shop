import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:we_shop/core/utils/scaffold_helper.dart';
import 'package:we_shop/core/widgets/internet_restored_widget.dart';
import 'package:we_shop/core/widgets/no_internet_widget.dart';

class InternetChecker {
  final ScaffoldHelper scaffoldHelper;
  bool isConnected = true;
  InternetChecker(this.scaffoldHelper) {
    InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          if (isConnected == false) {
            scaffoldHelper.showSnackBar(const InternetRestoredWidget(),
                duration: const Duration(seconds: 4), background: Colors.green);
          }
          isConnected = true;
          break;
        case InternetStatus.disconnected:
          isConnected = false;
          scaffoldHelper.showSnackBar(const NoInternetWidget(),
              duration: const Duration(days: 365),
              background: Colors.redAccent);
          break;
      }
    });
  }
}
