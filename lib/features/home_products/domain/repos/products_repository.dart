import 'package:dartz/dartz.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getMainProducts();
  Future<Either<Failure, List<Product>>> getMostUsedProducts();
  Future<Either<Failure, List<Product>>> getRecommendedProducts();
}
