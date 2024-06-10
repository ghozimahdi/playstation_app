import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as I;
import 'package:ps5_99/core/auth_interceptor.dart';
import 'package:ps5_99/core/error_interceptor.dart';
import 'package:ps5_99/core/network_module.dart';

@I.Injectable(as: NetworkModule)
class NetworkModuleImplTest extends NetworkModule {}

void main() {
  late NetworkModuleImplTest networkModule;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: 'BASE_URL=https://example.com');

    networkModule = NetworkModuleImplTest();
  });

  group('NetworkModule', () {
    test('should return Dio instance for production environment', () {
      final dio = networkModule.dioProd;

      expect(dio.options.baseUrl, 'https://example.com');
      expect(dio.options.connectTimeout, const Duration(milliseconds: 20000));
      expect(dio.options.sendTimeout, const Duration(milliseconds: 30000));
      expect(dio.options.receiveTimeout, const Duration(milliseconds: 30000));

      final expectedInterceptors = [
        isA<AuthInterceptor>(),
        isA<ErrorInterceptor>(),
      ];

      if (kDebugMode) {
        expectedInterceptors.addAll([
          isA<LogInterceptor>(),
          isA<ChuckerDioInterceptor>(),
        ]);
      }

      // Check that each expected interceptor is in the list of interceptors
      for (final expected in expectedInterceptors) {
        expect(dio.interceptors, contains(expected));
      }
    });

    test('should return Dio instance for dev/test environment', () {
      final dio = networkModule.dio;

      expect(dio.options.baseUrl, 'https://example.com');
      expect(dio.options.connectTimeout, const Duration(milliseconds: 20000));
      expect(dio.options.sendTimeout, const Duration(milliseconds: 30000));
      expect(dio.options.receiveTimeout, const Duration(milliseconds: 30000));

      final expectedInterceptors = [
        isA<AuthInterceptor>(),
        isA<ErrorInterceptor>(),
        isA<LogInterceptor>(),
        isA<ChuckerDioInterceptor>(),
      ];

      // Check that each expected interceptor is in the list of interceptors
      for (final expected in expectedInterceptors) {
        expect(dio.interceptors, contains(expected));
      }
    });
  });
}
