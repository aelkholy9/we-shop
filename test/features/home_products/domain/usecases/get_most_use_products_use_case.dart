import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_most_used_products_use_case.dart';
import 'get_main_products_use_case.mocks.dart';

@GenerateMocks([ProductsRepository])
void main() {
  late MockProductsRepository mockProductsRepository;
  late GetMostUsedProductsUseCase useCase;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
    useCase = GetMostUsedProductsUseCase(mockProductsRepository);
  });

  group('test GetMostUseProductsUseCase', () {
    final productList = [
      Product(id: 1, title: 'Product 1'),
      Product(id: 2, title: 'Product 2')
    ];

    test('should return a list of products when the repo returns data',
        () async {
      when(mockProductsRepository.getMostUsedProducts(any))
          .thenAnswer((_) async => productList);

      final result = await useCase.execute();

      expect(result, equals(Right(productList)));
      verify(mockProductsRepository.getMostUsedProducts(any)).called(1);
      verifyNoMoreInteractions(mockProductsRepository);
    });

    test('should return a failure when the repository fails to fetch products',
        () async {
      when(mockProductsRepository.getMostUsedProducts(any)).thenThrow("hello");

      final result = await useCase.execute();

      expect(result, const Left(Failure("hello")));
      verify(mockProductsRepository.getMostUsedProducts(any)).called(1);
    });

    test('should return a failure when there is a connection error', () async {
      final dioException = DioException(
          message: "connection error",
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError);
      when(mockProductsRepository.getMostUsedProducts(any))
          .thenThrow(dioException);

      final result = await useCase.execute();

      expect(result, const Left(Failure("connection error")));
      verify(mockProductsRepository.getMostUsedProducts(any)).called(1);
    });
  });
}
