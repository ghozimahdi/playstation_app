import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';

abstract class GameDatasource {
  Future<GameListResponseDto> getGameList({
    required int page,
  });
}
