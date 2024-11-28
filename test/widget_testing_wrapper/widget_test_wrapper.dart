import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/assets.dart';

class WidgetTestWrapper extends StatelessWidget {
  final Widget child;
  const WidgetTestWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: Assets.translations,
      fallbackLocale: const Locale('en'),
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: EasyLocalization.of(context)?.locale,
          supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          localizationsDelegates: EasyLocalization.of(context)!.delegates,
          home: child,
        );
      }),
    );
  }
}
