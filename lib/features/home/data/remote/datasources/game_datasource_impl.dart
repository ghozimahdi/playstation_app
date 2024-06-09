import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/features/home/data/remote/datasources/game_datasource.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';

@LazySingleton(as: GameDatasource)
class GameDataSourcesImpl extends GameDatasource {
  final Dio dio;

  GameDataSourcesImpl(this.dio);

  String _generateDateRange() {
    final DateTime endDate = DateTime.now();
    final DateTime startDate =
        DateTime(endDate.year - 1, endDate.month, endDate.day);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedStartDate = formatter.format(startDate);
    final String formattedEndDate = formatter.format(endDate);
    return '$formattedStartDate,$formattedEndDate';
  }

  @override
  Future<List<GameListResponseDto>> getGameList({
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
          'dates': _generateDateRange(),
        },
      );

      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;
      return results
          .map((e) => GameListResponseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<GameDetailResponseDto> getGameDetail({required String id}) async {
    try {
      final response = await dio.get("games/$id");
      final data = response.data as Map<String, dynamic>;
      return GameDetailResponseDto.fromJson(data);
    } catch (_) {
      rethrow;
    }
  }
}
