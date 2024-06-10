import 'package:injectable/injectable.dart';
import 'package:ps5_99/common/interactor.dart';
import 'package:ps5_99/features/home/domain/mappers/games_mappers.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

@lazySingleton
class GetGameListUsesCase
    extends Interactor<GetGameListUsesCaseParams, List<GameModel>> {
  final GameRepository _repository;

  GetGameListUsesCase(this._repository);

  @override
  Future<List<GameModel>> doWork(GetGameListUsesCaseParams params) async {
    final result = await _repository.getGameList(page: params.page);
    return result.toGameListModel();
  }
}

class GetGameListUsesCaseParams {
  final int page;

  GetGameListUsesCaseParams({required this.page});
}
