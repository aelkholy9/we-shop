import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/presentation/blocs/main_products_bloc/main_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/common/product_tile.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/main_products/main_products_loading_widget.dart';

class MainProductsWidget extends StatelessWidget {
  const MainProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DesignTokens.mediumVerticalSpacing),
          ScreenHorizontalPaddingWrapper(
            child: Text(
              AppLocale.snackProducts.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const SizedBox(height: DesignTokens.smallVerticalSpacing),
          BlocBuilder<MainProductsBloc, MainProductsState>(
            builder: (context, state) {
              if (state is MainProductsSuccess) {
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
              } else if (state is MainProductsFailure) {
                return SizedBox(
                  width: double.infinity,
                  child: Center(child: Text(state.title)),
                );
              }
              return const MainProductsLoadingWidget();
            },
          ),
        ],
      ),
    );
  }
}
