import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/widgets/CustomHorizontalDivider.dart';
import 'package:we_shop/core/widgets/screen_padding_wrapper.dart';
import 'package:we_shop/features/home_products/presentation/blocs/main_products_bloc/main_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/blocs/most_use_products_bloc/most_use_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/main_products/main_products_widget.dart';
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
      body: const CustomScrollView(
        slivers: [
          MainProductsWidget(),
          SliverToBoxAdapter(
            child: ScreenHorizontalPaddingWrapper(
              child: CustomHorizontalDivider(),
            ),
          ),
          MostUsedProductsWidget(),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(value: getIt<MainProductsBloc>()),
      BlocProvider.value(value: getIt<MostUseProductsBloc>()),
    ], child: this);
  }
}
