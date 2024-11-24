import 'package:auto_route/auto_route.dart';
import 'package:we_shop/core/routing/app_router.gr.dart';
import 'package:we_shop/features/home_products/presentation/views/guards/home_route_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: HomeRoute.page, initial: true, guards: [HomeRouteGuard()]),
      ];
}
