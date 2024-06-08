import 'package:dio/dio.dart';

class ServerException extends DioException {
  ServerException({
    super.response,
    required super.requestOptions,
  });
}
