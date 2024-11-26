import 'package:flutter/material.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/presentation/views/common/product_tile_skeleton.dart';

class ProductsLoadingWidget extends StatelessWidget {
  const ProductsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHorizontalPaddingWrapper(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              ((constraints.maxWidth) / 114.0).floor(),
              (index) => Container(
                  margin: const EdgeInsetsDirectional.only(end: 14),
                  child: const ProductTileSkeleton()),
            ),
          );
        }),
      ),
    );
  }
}
