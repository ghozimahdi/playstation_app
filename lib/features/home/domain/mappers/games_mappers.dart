import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';
import 'package:ps5_99/features/home/domain/model/games_model.dart';

extension GamesMappers on GameListResponseDto {
  List<GamesModel> toGameList() {
    return results?.map((e) => e.toGamesModel()).toList() ?? [];
  }
}

extension GameListResultDto on ResultDto {
  GamesModel toGamesModel() {
    return GamesModel(
      imageUrl: backgroundImage ?? '',
      name: name ?? '',
      released: released ?? DateTime.now(),
      rating: rating ?? 0,
      id: '${id ?? ''}',
    );
  }
}
