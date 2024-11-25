import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:we_shop/core/constants/assets.dart';
import 'package:we_shop/core/routing/app_router.dart';
import 'package:we_shop/core/theme/default_theme.dart';
import 'package:we_shop/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupDependencies();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
    ],
    path: Assets.translations,
    fallbackLocale: const Locale('en', 'US'),
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'We Shop',
      theme: AppTheme.light,
    );
  }
}
