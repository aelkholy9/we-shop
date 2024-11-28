import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:we_shop/core/failure/failure.dart';

Future<Either<Failure, T>> executeAndHandleError<T>(
    Future<T> Function() process) async {
  try {
    return Right(await process());
  } on DioException catch (e) {
    return const Left(Failure("Network error"));
  } catch (e) {
    return Left(Failure(e.toString()));
  }
}
