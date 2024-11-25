import 'package:flutter/material.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: DesignTokens.smallVerticalSpacing,
        thickness: 4,
        color: Theme.of(context).colorScheme.secondary);
  }
}
