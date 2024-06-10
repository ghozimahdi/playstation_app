import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/core/error_interceptor.dart';
import 'package:ps5_99/core/exception/client_exception.dart';
import 'package:ps5_99/core/exception/connection_exception.dart';
import 'package:ps5_99/core/exception/server_exception.dart';

void main() {
  late ErrorInterceptor errorInterceptor;
  late ErrorInterceptorHandler handler;

  setUp(() {
    errorInterceptor = ErrorInterceptor();
    handler = ErrorInterceptorHandler();
  });

  group('ErrorInterceptor', () {
    test('should throw ConnectionException on connection error', () {
      final dioError = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionError,
      );

      expect(
        () => errorInterceptor.onError(dioError, handler),
        throwsA(isA<ConnectionException>()),
      );
    });

    test('should throw ServerException on server error', () {
      final dioError = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 500,
        ),
        type: DioExceptionType.badResponse,
      );

      expect(
        () => errorInterceptor.onError(dioError, handler),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ClientException on client error', () {
      final dioError = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 400,
          data: {"message": "Client error"},
        ),
        type: DioExceptionType.badResponse,
      );

      expect(
        () => errorInterceptor.onError(dioError, handler),
        throwsA(isA<ClientException>()),
      );
    });

    test('should throw ClientException on unknown error', () {
      final dioError = DioException(
        requestOptions: RequestOptions(),
      );

      expect(
        () => errorInterceptor.onError(dioError, handler),
        throwsA(isA<ClientException>()),
      );
    });
  });
}
