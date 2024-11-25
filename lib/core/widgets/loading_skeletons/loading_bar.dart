import 'package:flutter/material.dart';
import 'package:we_shop/core/theme/design_tokens.dart';

class LoadingBarSkeleton extends StatelessWidget {
  final double width;
  final double height;
  const LoadingBarSkeleton(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DesignTokens.borderRadiusSmall),
      ),
    );
  }
}
