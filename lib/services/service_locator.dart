import 'package:get_it/get_it.dart';
import 'package:we_shop/core/network/dio_network_client.dart';
import 'package:we_shop/core/network/network_client.dart';
import 'package:we_shop/core/routing/app_router.dart';
import 'package:we_shop/features/home_products/data/data_sources/remote/remote_product_data_source.dart';
import 'package:we_shop/features/home_products/data/data_sources/remote/remote_product_date_source_impl.dart';
import 'package:we_shop/features/home_products/data/repos/products_repository_impl.dart';
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_main_products_use_case.dart';
import 'package:we_shop/features/home_products/presentation/blocs/main_products_bloc/main_products_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<NetworkClient>(DioNetworkClient());

  //register data sources
  getIt.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSourceImpl(getIt<NetworkClient>()),
  );

  //register repos
  getIt.registerSingleton<ProductsRepository>(
    ProductsRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );

  //register use cases
  getIt.registerSingleton<GetMainProductsUseCase>(
    GetMainProductsUseCase(getIt<ProductsRepository>()),
  );

  //register blocs
  getIt.registerSingleton<MainProductsBloc>(
    MainProductsBloc(getIt<GetMainProductsUseCase>()),
  );
}
