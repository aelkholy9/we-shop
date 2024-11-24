import 'package:auto_route/auto_route.dart';
import 'package:we_shop/features/home_products/presentation/blocs/main_products_bloc/main_products_bloc.dart';
import 'package:we_shop/services/service_locator.dart';

class HomeRouteGuard extends AutoRouteGuard {
  HomeRouteGuard();

  @override
  Future<void> onNavigation(NavigationResolver resolver, _) async {
    getIt<MainProductsBloc>().add(GetMainProductsEvent());
    resolver.next();
  }
}
