import 'package:dio/dio.dart';

extension ResponseStatus on Response {
  bool get isSuccessful {
    if (statusCode == null) {
      return false;
    }
    return statusCode! >= 200 && statusCode! < 300;
  }
}
