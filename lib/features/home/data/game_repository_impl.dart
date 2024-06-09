import 'package:injectable/injectable.dart';
import 'package:ps5_99/features/home/data/remote/datasources/game_datasource.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

@LazySingleton(as: GameRepository)
class GameRepositoryImpl extends GameRepository {
  final GameDatasource datasource;

  GameRepositoryImpl(this.datasource);

  @override
  Future<List<GameListResponseDto>> getGameList({required int page}) {
    return datasource.getGameList(page: page);
  }

  @override
  Future<GameDetailResponseDto> getGameDetail({required String id}) {
    return datasource.getGameDetail(id: id);
  }
}
