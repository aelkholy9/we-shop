// Mocks generated by Mockito 5.4.4 from annotations
// in we_shop/test/features/home_products/presentation/views/home_screen/home_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i14;

import 'package:dartz/dartz.dart' as _i3;
import 'package:file/file.dart' as _i4;
import 'package:flutter_cache_manager/src/cache_managers/base_cache_manager.dart'
    as _i12;
import 'package:flutter_cache_manager/src/result/file_info.dart' as _i5;
import 'package:flutter_cache_manager/src/result/file_response.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;
import 'package:we_shop/core/failure/failure.dart' as _i8;
import 'package:we_shop/features/home_products/domain/entities/Product.dart'
    as _i9;
import 'package:we_shop/features/home_products/domain/repos/products_repository.dart'
    as _i2;
import 'package:we_shop/features/home_products/domain/use_cases/get_recommended_products_use_case.dart'
    as _i10;
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_main_products_use_case.dart'
    as _i6;
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_most_used_products_use_case.dart'
    as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductsRepository_0 extends _i1.SmartFake
    implements _i2.ProductsRepository {
  _FakeProductsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_2 extends _i1.SmartFake implements _i4.File {
  _FakeFile_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileInfo_3 extends _i1.SmartFake implements _i5.FileInfo {
  _FakeFileInfo_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetMainProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMainProductsUseCase extends _i1.Mock
    implements _i6.GetMainProductsUseCase {
  MockGetMainProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductsRepository get productsRepository => (super.noSuchMethod(
        Invocation.getter(#productsRepository),
        returnValue: _FakeProductsRepository_0(
          this,
          Invocation.getter(#productsRepository),
        ),
      ) as _i2.ProductsRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>.value(
                _FakeEither_1<_i8.Failure, List<_i9.Product>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>);
}

/// A class which mocks [GetRecommendedProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetRecommendedProductsUseCase extends _i1.Mock
    implements _i10.GetRecommendedProductsUseCase {
  MockGetRecommendedProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductsRepository get productsRepository => (super.noSuchMethod(
        Invocation.getter(#productsRepository),
        returnValue: _FakeProductsRepository_0(
          this,
          Invocation.getter(#productsRepository),
        ),
      ) as _i2.ProductsRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>.value(
                _FakeEither_1<_i8.Failure, List<_i9.Product>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>);
}

/// A class which mocks [GetMostUsedProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMostUsedProductsUseCase extends _i1.Mock
    implements _i11.GetMostUsedProductsUseCase {
  MockGetMostUsedProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductsRepository get productsRepository => (super.noSuchMethod(
        Invocation.getter(#productsRepository),
        returnValue: _FakeProductsRepository_0(
          this,
          Invocation.getter(#productsRepository),
        ),
      ) as _i2.ProductsRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>> execute(
          [int? offset]) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [offset],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>.value(
                _FakeEither_1<_i8.Failure, List<_i9.Product>>(
          this,
          Invocation.method(
            #execute,
            [offset],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Product>>>);
}

/// A class which mocks [BaseCacheManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseCacheManager extends _i1.Mock implements _i12.BaseCacheManager {
  MockBaseCacheManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i4.File> getSingleFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingleFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i7.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #getSingleFile,
            [url],
            {
              #key: key,
              #headers: headers,
            },
          ),
        )),
      ) as _i7.Future<_i4.File>);

  @override
  _i7.Stream<_i5.FileInfo> getFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i7.Stream<_i5.FileInfo>.empty(),
      ) as _i7.Stream<_i5.FileInfo>);

  @override
  _i7.Stream<_i13.FileResponse> getFileStream(
    String? url, {
    String? key,
    Map<String, String>? headers,
    bool? withProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileStream,
          [url],
          {
            #key: key,
            #headers: headers,
            #withProgress: withProgress,
          },
        ),
        returnValue: _i7.Stream<_i13.FileResponse>.empty(),
      ) as _i7.Stream<_i13.FileResponse>);

  @override
  _i7.Future<_i5.FileInfo> downloadFile(
    String? url, {
    String? key,
    Map<String, String>? authHeaders,
    bool? force = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadFile,
          [url],
          {
            #key: key,
            #authHeaders: authHeaders,
            #force: force,
          },
        ),
        returnValue: _i7.Future<_i5.FileInfo>.value(_FakeFileInfo_3(
          this,
          Invocation.method(
            #downloadFile,
            [url],
            {
              #key: key,
              #authHeaders: authHeaders,
              #force: force,
            },
          ),
        )),
      ) as _i7.Future<_i5.FileInfo>);

  @override
  _i7.Future<_i5.FileInfo?> getFileFromCache(
    String? key, {
    bool? ignoreMemCache = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromCache,
          [key],
          {#ignoreMemCache: ignoreMemCache},
        ),
        returnValue: _i7.Future<_i5.FileInfo?>.value(),
      ) as _i7.Future<_i5.FileInfo?>);

  @override
  _i7.Future<_i5.FileInfo?> getFileFromMemory(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromMemory,
          [key],
        ),
        returnValue: _i7.Future<_i5.FileInfo?>.value(),
      ) as _i7.Future<_i5.FileInfo?>);

  @override
  _i7.Future<_i4.File> putFile(
    String? url,
    _i14.Uint8List? fileBytes, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFile,
          [
            url,
            fileBytes,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i7.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #putFile,
            [
              url,
              fileBytes,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i7.Future<_i4.File>);

  @override
  _i7.Future<_i4.File> putFileStream(
    String? url,
    _i7.Stream<List<int>>? source, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFileStream,
          [
            url,
            source,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i7.Future<_i4.File>.value(_FakeFile_2(
          this,
          Invocation.method(
            #putFileStream,
            [
              url,
              source,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i7.Future<_i4.File>);

  @override
  _i7.Future<void> removeFile(String? key) => (super.noSuchMethod(
        Invocation.method(
          #removeFile,
          [key],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> emptyCache() => (super.noSuchMethod(
        Invocation.method(
          #emptyCache,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
