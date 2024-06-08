import 'package:dio/dio.dart';

class ClientException extends DioException {
  ClientException({
    super.response,
    required super.requestOptions,
    required String super.message,
  });

  @override
  String toString() {
    return message ?? '';
  }
}
