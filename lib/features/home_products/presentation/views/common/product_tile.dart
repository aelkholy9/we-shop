import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/constants/colors.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/core/widgets/safe_network_image.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final double? width;
  final double? height;
  const ProductTile(
      {super.key, required this.product, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(DesignTokens.borderRadiusSmall),
              child: SafeNetworkImage(
                url: product.images?.first ?? "http",
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppLocale.sar.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        (product.price ?? 0.0).toStringAsFixed(2),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Expanded(
                    child: Text(
                  product.title ?? " ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(height: 1.24),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
