import 'package:injectable/injectable.dart';
import 'package:ps5_99/common/interactor.dart';
import 'package:ps5_99/features/home/domain/mappers/games_mappers.dart';
import 'package:ps5_99/features/home/domain/model/games_model.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

@lazySingleton
class GetGameListUsesCase
    extends Interactor<GetGameListUsesCaseParams, List<GamesModel>> {
  final GameRepository _repository;

  GetGameListUsesCase(this._repository);

  @override
  Future<List<GamesModel>> doWork(GetGameListUsesCaseParams params) async {
    final result = await _repository.getGameList(page: params.page);
    return result.toGameListModel();
  }
}

class GetGameListUsesCaseParams {
  final int page;

  GetGameListUsesCaseParams({required this.page});
}
