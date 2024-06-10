import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/core/auth_interceptor.dart';

import 'auth_interceptor_test.mocks.dart';

@GenerateMocks([RequestInterceptorHandler])
void main() {
  late AuthInterceptor authInterceptor;
  late MockRequestInterceptorHandler mockHandler;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: 'KEY=test_key');
    authInterceptor = AuthInterceptor();
    mockHandler = MockRequestInterceptorHandler();
  });

  group('AuthInterceptor', () {
    test('should add key to query parameters for GET requests', () async {
      final options = RequestOptions(
        path: 'test',
        method: 'GET',
        queryParameters: {},
      );

      await authInterceptor.onRequest(options, mockHandler);

      expect(options.queryParameters['key'], equals('test_key'));
      verify(mockHandler.next(options)).called(1);
    });

    test('should not add key to query parameters for non-GET requests',
        () async {
      final options = RequestOptions(
        path: 'test',
        method: 'POST',
        queryParameters: {},
      );

      await authInterceptor.onRequest(options, mockHandler);

      expect(options.queryParameters.containsKey('key'), isFalse);
      verify(mockHandler.next(options)).called(1);
    });
  });
}
