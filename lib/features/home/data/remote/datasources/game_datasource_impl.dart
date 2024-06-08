import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/features/home/data/remote/datasources/game_datasource.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';

@LazySingleton(as: GameDatasource)
class GameDataSourcesImpl extends GameDatasource {
  final Dio dio;

  GameDataSourcesImpl(this.dio);

  @override
  Future<GameListResponseDto> getGameList({
    required int page,
  }) async {
    try {
      final response = await dio.get(
        "games",
        queryParameters: {
          'page': page,
          'page_size': 20,
          'platforms': 187,
          'ordering': '-released',
          'dates': '2020-12-21,2021-12-21',
          'key': '02ef6ba5d13444ee86bad607e8bce3f4',
        },
      );

      final data = response.data as Map<String, dynamic>;
      return GameListResponseDto.fromJson(data);
    } catch (_) {
      rethrow;
    }
  }
}
