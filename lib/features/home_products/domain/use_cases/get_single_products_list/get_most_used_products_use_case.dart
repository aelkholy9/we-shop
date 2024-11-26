import 'package:dartz/dartz.dart';
import 'package:we_shop/core/failure/execute_and_handle_function.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart';
import 'get_product_list_use_case.dart';

class GetMostUsedProductsUseCase implements GetProductListUseCase {
  final ProductsRepository productsRepository;
  GetMostUsedProductsUseCase(this.productsRepository);

  @override
  Future<Either<Failure, List<Product>>> execute([int? offset]) async {
    return executeAndHandleError<List<Product>>(
      () => productsRepository.getMostUsedProducts(offset ?? 0),
    );
  }
}