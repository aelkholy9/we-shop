import 'package:flutter/material.dart';
import 'package:we_shop/core/widgets/loading_skeletons/loading_bar.dart';
import 'package:we_shop/core/widgets/loading_skeletons/shimmer_wrapper.dart';

class ProductTileSkeleton extends StatelessWidget {
  const ProductTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerWrapper(
      child: SizedBox(
        width: 100,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: LoadingBarSkeleton(
                  width: double.infinity, height: double.infinity),
            ),
            SizedBox(height: 8),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingBarSkeleton(width: 60, height: 10),
                  SizedBox(height: 5),
                  LoadingBarSkeleton(width: 100, height: 10),
                  SizedBox(height: 5),
                  LoadingBarSkeleton(width: 100, height: 10),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
