import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/core/auth_interceptor.dart';
import 'package:ps5_99/core/error_interceptor.dart';

@module
abstract class NetworkModule {
  @LazySingleton(env: [Environment.prod])
  Dio get dioProd {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('BASE_URL'),
        connectTimeout: const Duration(milliseconds: 20000),
        sendTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
      ),
    );
    dio.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);

    if (kDebugMode) {
      dio.interceptors.addAll(
        [
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
          ChuckerDioInterceptor(),
        ],
      );
    }
    return dio;
  }

  @LazySingleton(env: [Environment.dev, Environment.test])
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('BASE_URL'),
        connectTimeout: const Duration(milliseconds: 20000),
        sendTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      ChuckerDioInterceptor(),
    ]);
    return dio;
  }
}
