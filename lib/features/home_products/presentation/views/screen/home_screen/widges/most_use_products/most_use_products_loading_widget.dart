import 'package:flutter/material.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/features/home_products/presentation/views/common/product_tile_skeleton.dart';

class MostUseProductsLoadingWidget extends StatelessWidget {
  const MostUseProductsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: DesignTokens.productTileSpacing,
          crossAxisSpacing: DesignTokens.productTileSpacing,
        ),
        children: List.generate(
          6,
          (index) => const ProductTileSkeleton(),
        ),
      );
    });
  }
}
