import 'package:we_shop/features/home_products/data/data_sources/remote/remote_product_date_source_impl.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductRemoteDataSource remoteProductDataSource;
  ProductsRepositoryImpl(this.remoteProductDataSource);

  @override
  Future<List<Product>> getMainProducts() async {
    return await remoteProductDataSource.getMainProducts();
  }

  @override
  Future<List<Product>> getMostUsedProducts(int offset) async {
    return await remoteProductDataSource.getMostUsedProducts(offset);
  }

  @override
  Future<List<Product>> getRecommendedProducts() async {
    return await remoteProductDataSource.getRecommendedProducts();
  }
}
