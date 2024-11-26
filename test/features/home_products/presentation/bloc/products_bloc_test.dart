import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_product_list_use_case.dart';
import 'package:we_shop/features/home_products/presentation/blocs/single_products_list_bloc/products_bloc.dart';

import 'products_bloc_test.mocks.dart';

@GenerateMocks([GetProductListUseCase])
void main() {
  group('test products bloc', () {
    late MockGetProductListUseCase mockGetProductListUseCase;
    late ProductsBloc productsBloc;

    setUp(() {
      mockGetProductListUseCase = MockGetProductListUseCase();
      productsBloc = ProductsBloc(mockGetProductListUseCase);
    });

    tearDown(() {
      productsBloc.close();
    });

    test('initial state is ProductsInitialState', () {
      expect(productsBloc.state, isA<ProductsInitialState>());
    });

    blocTest<ProductsBloc, ProductsState>(
      'should emit ProductsSuccessState when GetProductsEvent is added and products returned successfully',
      build: () {
        when(mockGetProductListUseCase.execute()).thenAnswer((_) async =>
            Right([
              Product(id: 1, title: 'Product 1'),
              Product(id: 2, title: 'Product 2')
            ]));
        return productsBloc;
      },
      act: (bloc) => bloc.add(GetProductsEvent()),
      expect: () => [
        ProductsSuccessState([
          Product(id: 1, title: 'Product 1'),
          Product(id: 2, title: 'Product 2'),
        ]),
      ],
      verify: (_) {
        verify(mockGetProductListUseCase.execute()).called(1);
      },
    );

    blocTest<ProductsBloc, ProductsState>(
      'should emit ProductsFailureState when GetProductsEvent is added and use case returns an error',
      build: () {
        when(mockGetProductListUseCase.execute())
            .thenAnswer((_) async => Left(Failure('error')));
        return productsBloc;
      },
      act: (bloc) => bloc.add(GetProductsEvent()),
      expect: () => [
        ProductsFailureState('error'),
      ],
      verify: (_) {
        verify(mockGetProductListUseCase.execute()).called(1);
      },
    );
  });
}
