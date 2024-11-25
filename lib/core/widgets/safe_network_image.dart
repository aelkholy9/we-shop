import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/colors.dart';
import 'package:we_shop/core/widgets/loading_skeletons/shimmer_wrapper.dart';

class SafeNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  const SafeNetworkImage(
      {super.key, required this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => ShimmerWrapper(
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error_outline,
          color: AppColors.lightGrey,
          size: 30,
        ),
      ),
    );
  }
}
