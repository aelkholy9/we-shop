import 'package:dartz/dartz.dart';
import 'package:we_shop/core/failure/execute_and_handle_function.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart';

class GetMostUsedProductsUseCase {
  final ProductsRepository productsRepository;
  GetMostUsedProductsUseCase(this.productsRepository);

  Future<Either<Failure, List<Product>>> execute() async {
    return executeAndHandleError<List<Product>>(
      () => productsRepository.getMostUsedProducts(),
    );
  }
}
