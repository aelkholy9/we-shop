import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/presentation/blocs/single_products_list_bloc/products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/common/product_tile.dart';

import 'products_loading_widget.dart';

class ProductsWidget extends StatelessWidget {
  final String title;
  const ProductsWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: DesignTokens.mediumVerticalSpacing),
        ScreenHorizontalPaddingWrapper(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const SizedBox(height: DesignTokens.smallVerticalSpacing),
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccessState) {
              if (state.products.isEmpty) {
                return SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Center(child: Text(AppLocale.noItems.tr())),
                );
              }
              return SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0 || index == state.products.length + 1) {
                      return const SizedBox(
                          width: DesignTokens.screenHorizontalPadding);
                    }
                    return ProductTile(
                      product: state.products[index - 1],
                      width: 100,
                      height: 150,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: index == 0 ? 0 : DesignTokens.productTileSpacing,
                  ),
                ),
              );
            } else if (state is ProductsFailureState) {
              return SizedBox(
                width: double.infinity,
                child: Center(child: Text(state.title)),
              );
            }
            return const ProductsLoadingWidget();
          },
        ),
      ],
    );
  }
}
