import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/theme/design_tokens.dart';
import 'package:we_shop/core/widgets/CustomHorizontalDivider.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_recommended_products_use_case.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_main_products_use_case.dart';
import 'package:we_shop/features/home_products/presentation/blocs/most_use_products_bloc/most_use_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/blocs/single_products_list_bloc/products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/horizontal_products_list/products_list_widget.dart';
import 'package:we_shop/services/service_locator.dart';

import 'widges/most_use_products/most_used_products_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocale.products.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => ProductsBloc(getIt<GetMainProductsUseCase>())
                ..add(GetProductsEvent()),
              child: ProductsWidget(
                title: AppLocale.snackProducts.tr(),
              ),
            ),
          ),
          _buildSliverDivider(),
          const MostUsedProductsWidget(),
          _buildSliverDivider(),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) =>
                  ProductsBloc(getIt<GetRecommendedProductsUseCase>())
                    ..add(GetProductsEvent()),
              child: ProductsWidget(
                title: AppLocale.recommendation.tr(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.viewPaddingOf(context).bottom +
                    DesignTokens.largeVerticalSpacing),
          ),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<MostUseProductsBloc>()),
      ],
      child: this,
    );
  }

  Widget _buildSliverDivider() {
    return const SliverToBoxAdapter(
      child: ScreenHorizontalPaddingWrapper(
        child: CustomHorizontalDivider(),
      ),
    );
  }
}
