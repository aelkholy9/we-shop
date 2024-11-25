import 'package:flutter/material.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class CustomHorizontalDivider extends StatelessWidget {
  final EdgeInsets? padding;
  const CustomHorizontalDivider({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(top: DesignTokens.mediumVerticalSpacing),
      child:
          Divider(thickness: 4, color: Theme.of(context).colorScheme.secondary),
    );
  }
}
