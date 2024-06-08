import 'package:dio/dio.dart';

class ConnectionException extends DioException {
  ConnectionException({
    required super.requestOptions,
  });
}
