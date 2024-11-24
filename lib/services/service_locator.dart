import 'package:get_it/get_it.dart';
import 'package:we_shop/core/routing/app_router.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
