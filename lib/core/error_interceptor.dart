import 'package:dio/dio.dart';
import 'package:ps5_99/core/exception/client_exception.dart';
import 'package:ps5_99/core/exception/connection_exception.dart';
import 'package:ps5_99/core/exception/server_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        throw ConnectionException(
          requestOptions: err.requestOptions,
        );
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        final int? statusCode = err.response?.statusCode;
        if ((statusCode ?? 0) >= 500 && statusCode != 506) {
          throw ServerException(
            response: err.response,
            requestOptions: err.requestOptions,
          );
        } else {
          throw ClientException(
            response: err.response,
            requestOptions: err.requestOptions,
            message: err.response?.data["message"] as String? ?? '',
          );
        }
    }
  }
}
