import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_response_dto.dart';

abstract class GameRepository {
  Future<List<GameResponseDto>> getGameList({
    required int page,
  });

  Future<GameDetailResponseDto> getGameDetail({
    required String id,
  });
}
