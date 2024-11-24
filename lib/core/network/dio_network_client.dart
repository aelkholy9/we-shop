import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:we_shop/core/constants/constants.dart';
import 'package:we_shop/core/network/network_client.dart';

class DioNetworkClient implements NetworkClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  @override
  Future<Response> delete(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    return await dio.delete(url,
        data: body, options: Options(headers: headers));
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    return await dio.get(url,
        queryParameters: queryParams, options: Options(headers: headers));
  }

  @override
  Future<Response> post(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    return await dio.post(url, data: body, options: Options(headers: headers));
  }

  @override
  Future<Response> put(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    return await dio.put(url, data: body, options: Options(headers: headers));
  }
}
