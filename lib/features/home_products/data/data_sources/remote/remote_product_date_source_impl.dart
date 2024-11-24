import 'package:we_shop/features/home_products/domain/entities/Product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getMainProducts();
  Future<List<Product>> getMostUsedProducts(int offset);
  Future<List<Product>> getRecommendedProducts();
}
