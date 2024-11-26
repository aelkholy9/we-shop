import 'package:dartz/dartz.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

abstract class GetProductListUseCase {
  Future<Either<Failure, List<Product>>> execute();
}
