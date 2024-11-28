import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/constants/colors.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/presentation/blocs/most_use_products_bloc/most_use_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/common/product_tile.dart';
import 'most_use_products_loading_widget.dart';

class MostUsedProductsWidget extends StatelessWidget {
  const MostUsedProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DesignTokens.mediumVerticalSpacing),
          ScreenHorizontalPaddingWrapper(
            child: Text(
              AppLocale.mostUseProducts.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const SizedBox(height: DesignTokens.smallVerticalSpacing),
          ScreenHorizontalPaddingWrapper(
            child: BlocBuilder<MostUseProductsBloc, MostUseProductsState>(
              builder: (context, state) {
                if (state is MostUseProductsFailure) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(state.title)),
                  );
                } else if (state is MostUseProductsLoading) {
                  return const MostUseProductsLoadingWidget();
                }
                if (state.products.isEmpty) {
                  return SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Center(child: Text(AppLocale.noItems.tr())),
                  );
                }
                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: DesignTokens.productTileSpacing,
                        mainAxisSpacing: DesignTokens.productTileSpacing,
                        crossAxisCount: 3,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductTile(product: state.products[index]);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state is MoreMostUseProductsLoading)
                          const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              color: AppColors.green,
                              strokeWidth: 2,
                            ),
                          ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<MostUseProductsBloc>()
                                .add(GetMoreMostUseProductsEvent());
                          },
                          child: Text(
                            AppLocale.loadMore.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
