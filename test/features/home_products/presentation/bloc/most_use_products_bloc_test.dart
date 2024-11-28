import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_most_used_products_use_case.dart';
import 'package:we_shop/features/home_products/presentation/blocs/most_use_products_bloc/most_use_products_bloc.dart';

import 'most_use_products_bloc_test.mocks.dart';

@GenerateMocks([GetMostUsedProductsUseCase])
void main() {
  late MockGetMostUsedProductsUseCase mockUseCase;
  late MostUseProductsBloc bloc;

  setUp(() {
    mockUseCase = MockGetMostUsedProductsUseCase();
    bloc = MostUseProductsBloc(mockUseCase);
  });

  group('MostUseProductsBloc', () {
    final product1 = Product(id: 1, title: 'Product 1');
    final product2 = Product(id: 2, title: 'Product 2');
    final productList = [product1, product2];

    test('initial state should be MostUseProductsInitial', () {
      expect(bloc.state, equals(MostUseProductsInitial()));
    });

    blocTest<MostUseProductsBloc, MostUseProductsState>(
      'emits [MostUseProductsLoading, MostUseProductsSuccess] when GetMostUseProductsEvent is added',
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Right(productList));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMostUseProductsEvent()),
      expect: () => [
        const MostUseProductsLoading(0, []),
        MostUseProductsSuccess(0, productList, false),
      ],
      verify: (_) {
        verify(mockUseCase.execute()).called(1);
      },
    );

    blocTest<MostUseProductsBloc, MostUseProductsState>(
      'emits [MostUseProductsLoading, MostUseProductsFailure] when GetMostUseProductsEvent fails',
      build: () {
        when(mockUseCase.execute()).thenAnswer(
            (_) async => const Left(Failure('Failed to fetch products')));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMostUseProductsEvent()),
      expect: () => [
        const MostUseProductsLoading(0, []),
        const MostUseProductsFailure('Failed to fetch products', 0, []),
      ],
      verify: (_) {
        verify(mockUseCase.execute()).called(1);
      },
    );

    blocTest<MostUseProductsBloc, MostUseProductsState>(
      'emits [MoreMostUseProductsLoading, MostUseProductsSuccess] when GetMoreMostUseProductsEvent is added',
      build: () {
        when(mockUseCase.execute(1))
            .thenAnswer((_) async => Right(productList));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMoreMostUseProductsEvent()),
      expect: () => [
        const MoreMostUseProductsLoading(1, []),
        MostUseProductsSuccess(1, productList, false),
      ],
      verify: (_) {
        verify(mockUseCase.execute(1)).called(1);
      },
    );

    blocTest<MostUseProductsBloc, MostUseProductsState>(
      'emits [MoreMostUseProductsLoading, MostUseProductsFailure] when GetMoreMostUseProductsEvent fails',
      build: () {
        when(mockUseCase.execute(1)).thenAnswer(
            (_) async => const Left(Failure('Failed to fetch more products')));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMoreMostUseProductsEvent()),
      expect: () => [
        const MoreMostUseProductsLoading(1, []),
        const MostUseProductsFailure('Failed to fetch more products', 0, []),
      ],
      verify: (_) {
        verify(mockUseCase.execute(1)).called(1);
      },
    );

    blocTest<MostUseProductsBloc, MostUseProductsState>(
      'correctly handles pagination when GetMoreMostUseProductsEvent is added 2 times',
      build: () {
        when(mockUseCase.execute(any))
            .thenAnswer((_) async => Right(productList));
        return bloc;
      },
      act: (bloc) {
        bloc.add(GetMostUseProductsEvent());
        bloc.add(GetMoreMostUseProductsEvent());
        bloc.add(GetMoreMostUseProductsEvent());
      },
      expect: () => [
        const MostUseProductsLoading(0, []),
        MostUseProductsSuccess(0, productList, false),
        MoreMostUseProductsLoading(1, productList),
        MostUseProductsSuccess(1, [...productList, ...productList], false),
        MoreMostUseProductsLoading(2, [...productList, ...productList]),
        MostUseProductsSuccess(
            2, [...productList, ...productList, ...productList], false),
      ],
      verify: (_) {
        verify(mockUseCase.execute(any)).called(3);
      },
    );
  });
}
