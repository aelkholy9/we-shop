import 'package:we_shop/core/constants/api_constants.dart';
import 'package:we_shop/core/constants/constants.dart';
import 'package:we_shop/core/mocks/products_list_mock.dart';
import 'package:we_shop/core/network/network_client.dart';
import 'package:we_shop/features/home_products/data/models/ProductModel.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

import 'remote_product_date_source_impl.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkClient networkClient;
  ProductRemoteDataSourceImpl(this.networkClient);

  @override
  Future<List<Product>> getMainProducts() async {
    await Future.delayed(const Duration(seconds: 4));
    return productsListMock.take(5).toList();

    final products = await networkClient.get(
        '${ApiConstants.productsPrefix}?${Constants.limit}=${Constants.defaultPaginationLimit}&${Constants.offset}=3');
    return (products.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<Product>> getMostUsedProducts(int offset) async {
    await Future.delayed(const Duration(seconds: 4));
    return productsListMock.take(5).toList();
    final products = await networkClient.get(
        '${ApiConstants.productsPrefix}?${Constants.limit}=${Constants.defaultPaginationLimit}&${Constants.offset}=$offset');
    return (products.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<Product>> getRecommendedProducts() async {
    await Future.delayed(const Duration(seconds: 4));
    return productsListMock.toList();
    final products = await networkClient.get(
        '${ApiConstants.productsPrefix}?${Constants.limit}=${Constants.defaultPaginationLimit}&${Constants.offset}=4');
    return (products.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
