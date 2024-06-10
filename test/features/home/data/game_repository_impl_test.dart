import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/features/home/data/game_repository_impl.dart';
import 'package:ps5_99/features/home/data/remote/datasources/game_datasource.dart';

import '../../../dummy_data.dart';
import 'game_repository_impl_test.mocks.dart';

@GenerateMocks([GameDatasource])
void main() {
  late GameRepositoryImpl repository;
  late MockGameDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockGameDatasource();
    repository = GameRepositoryImpl(mockDatasource);
  });

  group('GameRepositoryImpl', () {
    test('should return game list from the datasource', () async {
      when(mockDatasource.getGameList(page: anyNamed('page')))
          .thenAnswer((_) async => DummyData.gameListResponseDto);

      final result = await repository.getGameList(page: 1);

      expect(result, DummyData.gameListResponseDto);
      verify(mockDatasource.getGameList(page: 1));
      verifyNoMoreInteractions(mockDatasource);
    });

    test('should return game detail from the datasource', () async {
      when(mockDatasource.getGameDetail(id: anyNamed('id')))
          .thenAnswer((_) async => DummyData.gameDetailResponseDto);

      final result = await repository.getGameDetail(id: '1');

      expect(result, DummyData.gameDetailResponseDto);
      verify(mockDatasource.getGameDetail(id: '1'));
      verifyNoMoreInteractions(mockDatasource);
    });

    test('should throw an exception when game list fetching fails', () async {
      when(mockDatasource.getGameList(page: anyNamed('page')))
          .thenThrow(Exception('Failed to fetch game list'));

      expect(() => repository.getGameList(page: 1), throwsException);
      verify(mockDatasource.getGameList(page: 1));
      verifyNoMoreInteractions(mockDatasource);
    });

    test('should throw an exception when game detail fetching fails', () async {
      when(mockDatasource.getGameDetail(id: anyNamed('id')))
          .thenThrow(Exception('Failed to fetch game detail'));

      expect(() => repository.getGameDetail(id: '1'), throwsException);
      verify(mockDatasource.getGameDetail(id: '1'));
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}
