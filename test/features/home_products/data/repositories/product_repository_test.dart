import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:we_shop/features/home_products/data/data_sources/remote/remote_product_date_source_impl.dart';
import 'package:we_shop/features/home_products/data/repos/products_repository_impl.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

import 'product_repository_test.mocks.dart';

@GenerateMocks([ProductRemoteDataSource])
void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductsRepositoryImpl productsRepository;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productsRepository = ProductsRepositoryImpl(mockProductRemoteDataSource);
  });

  group('test ProductsRepository', () {
    final product1 = Product(id: 1, title: 'Product x');
    final product2 = Product(id: 2, title: 'Product y');
    final productList = [product1, product2];

    test('should return a list of products from getMainProducts method',
        () async {
      when(mockProductRemoteDataSource.getMainProducts())
          .thenAnswer((_) async => productList);

      final result = await productsRepository.getMainProducts();

      expect(result, equals(productList));
      verify(mockProductRemoteDataSource.getMainProducts()).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should return a list of products from getMostUsedProducts method',
        () async {
      const offset = 0;
      when(mockProductRemoteDataSource.getMostUsedProducts(offset))
          .thenAnswer((_) async => productList);
      final result = await productsRepository.getMostUsedProducts(offset);
      expect(result, equals(productList));
      verify(mockProductRemoteDataSource.getMostUsedProducts(offset)).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should return a list of products from getRecommendedProducts method',
        () async {
      when(mockProductRemoteDataSource.getRecommendedProducts())
          .thenAnswer((_) async => productList);

      final result = await productsRepository.getRecommendedProducts();

      expect(result, equals(productList));
      verify(mockProductRemoteDataSource.getRecommendedProducts()).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should throw an exception when getMainProducts fails', () async {
      when(mockProductRemoteDataSource.getMainProducts())
          .thenThrow(Exception('Failed to fetch products'));

      expect(() => productsRepository.getMainProducts(),
          throwsA(isA<Exception>()));
      verify(mockProductRemoteDataSource.getMainProducts()).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should throw an exception when getMostUsedProducts() fails',
        () async {
      when(mockProductRemoteDataSource.getMostUsedProducts(0))
          .thenThrow(Exception('Failed to fetch most used products'));

      expect(() => productsRepository.getMostUsedProducts(0),
          throwsA(isA<Exception>()));
      verify(mockProductRemoteDataSource.getMostUsedProducts(0)).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should throw an exception if getRecommendedProducts() fails',
        () async {
      when(mockProductRemoteDataSource.getRecommendedProducts())
          .thenThrow(Exception('Failed to fetch recommended products'));

      expect(() => productsRepository.getRecommendedProducts(),
          throwsA(isA<Exception>()));
      verify(mockProductRemoteDataSource.getRecommendedProducts()).called(1);
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });
  });
}
