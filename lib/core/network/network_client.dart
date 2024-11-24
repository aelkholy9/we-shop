import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<Response> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });
  Future<Response> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });
  Future<Response> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });
}
