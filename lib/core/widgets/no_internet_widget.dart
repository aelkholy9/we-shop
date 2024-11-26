import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: DesignTokens.screenHorizontalPadding),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocale.noInternet.tr(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Icon(
            Icons.wifi_off_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
