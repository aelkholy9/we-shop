// Mocks generated by Mockito 5.4.4 from annotations
// in we_shop/test/features/home_products/data/data_sources/remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:we_shop/core/network/network_client.dart' as _i3;

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

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkClient extends _i1.Mock implements _i3.NetworkClient {
  MockNetworkClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response<dynamic>> get(
    String? url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {
            #queryParams: queryParams,
            #headers: headers,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #get,
            [url],
            {
              #queryParams: queryParams,
              #headers: headers,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);

  @override
  _i4.Future<_i2.Response<dynamic>> post(
    String? url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #body: body,
            #headers: headers,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #body: body,
              #headers: headers,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);

  @override
  _i4.Future<_i2.Response<dynamic>> put(
    String? url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #body: body,
            #headers: headers,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #body: body,
              #headers: headers,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);

  @override
  _i4.Future<_i2.Response<dynamic>> delete(
    String? url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #body: body,
            #headers: headers,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #body: body,
              #headers: headers,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
}
