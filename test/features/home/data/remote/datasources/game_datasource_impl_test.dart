import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/core/auth_interceptor.dart';
import 'package:ps5_99/core/error_interceptor.dart';
import 'package:ps5_99/core/exception/client_exception.dart';
import 'package:ps5_99/core/exception/connection_exception.dart';
import 'package:ps5_99/core/exception/server_exception.dart';
import 'package:ps5_99/features/home/data/remote/datasources/game_datasource_impl.dart';

import '../../../../../dummy_data.dart';
import 'game_datasource_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late GameDataSourcesImpl datasource;
  late MockDio mockDio;
  late Interceptors interceptors;

  setUp(() {
    mockDio = MockDio();
    interceptors = Interceptors();

    when(mockDio.interceptors).thenReturn(interceptors);
    interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);

    datasource = GameDataSourcesImpl(mockDio);
  });

  group('GameDataSourcesImpl', () {
    test('should return game list from the API', () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer(
        (_) async => Response(
          data: {
            "results": DummyData.gameListResponseJson,
          },
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final result = await datasource.getGameList(page: 1);

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].name, 'Game 1');
      verify(
        mockDio.get(
          'games',
          queryParameters: anyNamed('queryParameters'),
        ),
      );
      verifyNoMoreInteractions(mockDio);
    });

    test('should return game detail from the API', () async {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: DummyData.gameDetailResponseJson,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final result = await datasource.getGameDetail(id: '1');

      expect(result.id, 1);
      expect(result.name, 'Game 1');
      expect(result.description, 'Description of Game 1');
      verify(mockDio.get('games/1'));
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw ConnectionException when there is a connection error',
        () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenThrow(
        ConnectionException(
          requestOptions: RequestOptions(),
        ),
      );

      expect(
        () => datasource.getGameList(page: 1),
        throwsA(isA<ConnectionException>()),
      );
      verify(
        mockDio.get(
          'games',
          queryParameters: anyNamed('queryParameters'),
        ),
      );
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw ServerException when there is a server error', () async {
      when(mockDio.get(any)).thenThrow(
        ServerException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
        ),
      );

      expect(
        () => datasource.getGameDetail(id: '1'),
        throwsA(isA<ServerException>()),
      );
      verify(mockDio.get('games/1'));
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw ClientException when there is a client error', () async {
      when(mockDio.get(any)).thenThrow(
        ClientException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
            data: {"message": "Client error"},
          ),
          message: "Client error",
        ),
      );

      expect(
        () => datasource.getGameDetail(id: '1'),
        throwsA(isA<ClientException>()),
      );
      verify(mockDio.get('games/1'));
      verifyNoMoreInteractions(mockDio);
    });
  });
}
