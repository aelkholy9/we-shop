import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_shop/core/constants/app_locale_keys.dart';
import 'package:we_shop/core/constants/constants.dart';
import 'package:we_shop/core/failure/failure.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_recommended_products_use_case.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_main_products_use_case.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_most_used_products_use_case.dart';
import 'package:we_shop/features/home_products/presentation/blocs/most_use_products_bloc/most_use_products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/blocs/single_products_list_bloc/products_bloc.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/home_screen.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/horizontal_products_list/products_list_widget.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/horizontal_products_list/products_loading_widget.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/most_use_products/most_use_products_loading_widget.dart';
import 'package:we_shop/features/home_products/presentation/views/screen/home_screen/widges/most_use_products/most_used_products_widget.dart';
import 'package:we_shop/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../widget_testing_wrapper/widget_test_wrapper.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([
  GetMainProductsUseCase,
  GetRecommendedProductsUseCase,
  GetMostUsedProductsUseCase,
  BaseCacheManager
])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  late MockGetMainProductsUseCase mockMainProductsUseCase;
  late MockGetRecommendedProductsUseCase mockRecommendedProductsUseCase;
  late MockGetMostUsedProductsUseCase mockGetMostUsedProductsUseCase;
  late MockBaseCacheManager baseCacheManager;

  setUp(() async {
    mockMainProductsUseCase = MockGetMainProductsUseCase();
    mockRecommendedProductsUseCase = MockGetRecommendedProductsUseCase();
    mockGetMostUsedProductsUseCase = MockGetMostUsedProductsUseCase();
    getIt.registerSingleton<GetMainProductsUseCase>(mockMainProductsUseCase);
    getIt.registerSingleton<GetRecommendedProductsUseCase>(
        mockRecommendedProductsUseCase);
    getIt.registerSingleton<GetMostUsedProductsUseCase>(
        mockGetMostUsedProductsUseCase);
    baseCacheManager = MockBaseCacheManager();
    when(baseCacheManager.getFileFromCache(any)).thenThrow("error");
    getIt.registerSingleton<BaseCacheManager>(baseCacheManager);
  });

  tearDown(
    () => getIt.reset(),
  );

  testWidgets('home screen should display app bar and custom scroll view',
      (tester) async {
    await tester.runAsync(
      () async {
        when(mockMainProductsUseCase.execute())
            .thenAnswer((_) async => const Right([]));
        when(mockRecommendedProductsUseCase.execute())
            .thenAnswer((_) async => const Right([]));
        await tester.pumpWidget(
          WidgetTestWrapper(
            child: BlocProvider(
              create: (context) =>
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase),
              child: const HomeScreen(),
            ),
          ),
        );
        await tester.pump();
        expect(find.text("Products"), findsOneWidget);
        expect(find.byType(CustomScrollView), findsOneWidget);
        expect(find.byType(ProductsWidget), findsNWidgets(2));
        expect(find.byType(MostUsedProductsWidget), findsOneWidget);
      },
    );
  });

  group(
    "Test snack products section",
    () {
      testWidgets(
          'snack products should display "no items found" if no products received',
          (tester) async {
        when(mockMainProductsUseCase.execute())
            .thenAnswer((_) async => const Right([]));
        final productsBloc = ProductsBloc(mockMainProductsUseCase);
        await tester.runAsync(
          () async {
            await tester.pumpWidget(
              WidgetTestWrapper(
                child: BlocProvider<ProductsBloc>.value(
                  value: productsBloc,
                  child: const ProductsWidget(title: "Snacks products"),
                ),
              ),
            );
            productsBloc.add(GetProductsEvent());
            await tester.pumpAndSettle();
            await tester.pump();
            verify(mockMainProductsUseCase.execute()).called(1);
            expect(find.text(AppLocale.noItems.tr()), findsAny);
          },
        );
      });

      testWidgets(
          'snack products should display failure state when state is ProductFailureState',
          (tester) async {
        when(mockMainProductsUseCase.execute())
            .thenAnswer((_) async => const Left(Failure("error")));
        final productsBloc = ProductsBloc(mockMainProductsUseCase);
        await tester.runAsync(
          () async {
            await tester.pumpWidget(
              WidgetTestWrapper(
                child: BlocProvider<ProductsBloc>.value(
                  value: productsBloc,
                  child: const ProductsWidget(title: "Snacks products"),
                ),
              ),
            );
            productsBloc.add(GetProductsEvent());
            await tester.pumpAndSettle();
            await tester.pump();
            verify(mockMainProductsUseCase.execute()).called(1);
            expect(find.text("error"), findsAny);
          },
        );
      });

      testWidgets(
          'snack products should display loading state when state is ProductLoadingState',
          (tester) async {
        await tester.runAsync(
          () async {
            when(mockMainProductsUseCase.execute()).thenAnswer(
              (realInvocation) async {
                return const Right([]);
              },
            );
            final ProductsBloc productsBloc =
                ProductsBloc(mockMainProductsUseCase);
            await tester.pumpWidget(
              WidgetTestWrapper(
                child: BlocProvider(
                  create: (context) => productsBloc,
                  child: const ProductsWidget(title: "Snacks products"),
                ),
              ),
            );
            await tester.pump();
            productsBloc.add(GetProductsEvent());
            expect(
                find.byType(
                  ProductsLoadingWidget,
                ),
                findsNWidgets(1));
          },
        );
      });
    },
  );

  group(
    "test most used products section",
    () {
      final product = Product(
        title: 'kholy',
        images: const ['https://i.imgur.com/yVeIeDa.jpeg'],
        price: 20.0,
      );

      testWidgets(
        "show no items found when 0 products received",
        (tester) async {
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async => const Right([]),
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc,
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              mostUseProductsBloc.add(GetMostUseProductsEvent());
              await tester.pumpAndSettle();
              expect(find.text(AppLocale.noItems.tr()), findsOneWidget);
            },
          );
        },
      );

      testWidgets(
        "show error when failure received",
        (tester) async {
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async => const Left(Failure("error")),
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc,
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              mostUseProductsBloc.add(GetMostUseProductsEvent());
              await tester.pumpAndSettle();
              expect(find.text("error"), findsOneWidget);
            },
          );
        },
      );

      testWidgets(
        "test loading state",
        (tester) async {
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async {
              await Future.delayed(const Duration(seconds: 1));
              return const Right([]);
            },
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc..add(GetMostUseProductsEvent()),
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              await tester.pump(const Duration(milliseconds: 100));
              expect(
                  find.byType(MostUseProductsLoadingWidget), findsNWidgets(1));
            },
          );
        },
      );

      testWidgets(
        "show products grid and load more button when data is received with state flag hasMorePages=true",
        (tester) async {
          const numberOfElements = Constants.defaultPaginationLimit;
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async {
              return Right(
                List.generate(
                  numberOfElements,
                  (index) => product,
                ),
              );
            },
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc..add(GetMostUseProductsEvent()),
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              await tester.pump();
              expect(
                  find.text(product.title!), findsNWidgets(numberOfElements));
              expect(find.text("20.00"), findsNWidgets(numberOfElements));
              expect(find.byType(CachedNetworkImage),
                  findsNWidgets(numberOfElements));
              expect(find.text(AppLocale.loadMore.tr()), findsNWidgets(1));
            },
          );
        },
      );

      testWidgets(
        "show products grid and load more button when data is received with state flag hasMorePages=false",
        (tester) async {
          const numberOfElements = Constants.defaultPaginationLimit - 1;
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async {
              return Right(
                List.generate(
                  numberOfElements,
                  (index) => product,
                ),
              );
            },
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc..add(GetMostUseProductsEvent()),
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              await tester.pump();
              expect(
                  find.text(product.title!), findsNWidgets(numberOfElements));
              expect(find.text("20.00"), findsNWidgets(numberOfElements));
              expect(find.byType(CachedNetworkImage),
                  findsNWidgets(numberOfElements));
              expect(find.text(AppLocale.loadMore.tr()), findsNothing);
            },
          );
        },
      );

      testWidgets(
        "loading indicator should appear when clicking on load more",
        (tester) async {
          const numberOfElements = Constants.defaultPaginationLimit;
          when(mockGetMostUsedProductsUseCase.execute(argThat(isNull)))
              .thenAnswer(
            (_) async {
              return Right(
                List.generate(
                  numberOfElements,
                  (index) => product,
                ),
              );
            },
          );

          await tester.runAsync(
            () async {
              final mostUseProductsBloc =
                  MostUseProductsBloc(mockGetMostUsedProductsUseCase);
              await tester.pumpWidget(
                WidgetTestWrapper(
                  child: BlocProvider<MostUseProductsBloc>.value(
                    value: mostUseProductsBloc..add(GetMostUseProductsEvent()),
                    child: const CustomScrollView(
                      slivers: [MostUsedProductsWidget()],
                    ),
                  ),
                ),
              );
              await tester.pump();
              when(mockGetMostUsedProductsUseCase.execute(any)).thenAnswer(
                (_) async {
                  await Future.delayed(const Duration(seconds: 1));

                  return Right(
                    List.generate(
                      numberOfElements,
                      (index) => product,
                    ),
                  );
                },
              );
              await tester.dragUntilVisible(find.text(AppLocale.loadMore.tr()),
                  find.byType(CustomScrollView), const Offset(0, 200),
                  duration: const Duration(seconds: 1));
              await tester.pumpAndSettle();
              await tester.tap(find.byType(TextButton));
              await tester.pump(const Duration(milliseconds: 100));
              expect(find.byType(CircularProgressIndicator), findsNWidgets(1));
            },
          );
        },
      );
    },
  );
}
