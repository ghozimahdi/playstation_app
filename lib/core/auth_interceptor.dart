import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.method == 'GET') {
      options.queryParameters.addAll({
        'key': dotenv.get('KEY'),
      });
    }
    return super.onRequest(options, handler);
  }
}
