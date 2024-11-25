import 'package:flutter/cupertino.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class ScreenHorizontalPaddingWrapper extends StatelessWidget {
  final Widget child;
  const ScreenHorizontalPaddingWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.screenHorizontalPadding,
      ),
      child: child,
    );
  }
}
