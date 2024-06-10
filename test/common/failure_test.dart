import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/common/failure.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/core/exception/client_exception.dart';
import 'package:ps5_99/core/exception/connection_exception.dart';
import 'package:ps5_99/core/exception/permission_denied.dart';
import 'package:ps5_99/core/exception/server_exception.dart';

void main() {
  group('Failure.fromException', () {
    test('should return Failure for ServerException', () async {
      final exception = ServerException(requestOptions: RequestOptions());
      final failure = await Failure.fromException(exception);

      expect(failure.type, FailureType.server);
      expect(failure.title, cw.error_general_title.t);
      expect(failure.message, cw.error_general_subtitle.t);
      expect(failure.image, isA<Image>());
    });

    test('should return Failure for ConnectionException', () async {
      final exception = ConnectionException(requestOptions: RequestOptions());
      final failure = await Failure.fromException(exception);

      expect(failure.type, FailureType.connection);
      expect(failure.title, cw.error_connection_title.t);
      expect(failure.message, cw.error_connection_subtitle.t);
      expect(failure.image, isA<Image>());
    });

    test('should return Failure for ClientException', () async {
      final response = MockResponse();
      final exception = ClientException(
        requestOptions: RequestOptions(),
        message: 'Client error',
        response: response,
      );

      final failure = await Failure.fromException(exception);

      expect(failure.type, FailureType.client);
      expect(failure.message, 'Client error');
      expect(failure.statusCode, 0);
      expect(failure.image, isA<Image>());
    });

    test('should return Failure for PermissionDenied', () async {
      final exception = PermissionDenied();
      final failure = await Failure.fromException(exception);

      expect(failure.type, FailureType.permissionDenied);
      expect(failure.image, isA<Image>());
    });

    test('should return Failure for unknown exception', () async {
      final exception = Exception();
      final failure = await Failure.fromException(exception);

      expect(failure.type, FailureType.unknown);
      expect(failure.title, cw.error_general_title.t);
      expect(failure.message, cw.error_general_subtitle.t);
      expect(failure.image, isA<Image>());
    });
  });
}

class MockResponse extends Mock implements Response {}
