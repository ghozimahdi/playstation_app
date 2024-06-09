import 'package:injectable/injectable.dart';
import 'package:ps5_99/common/interactor.dart';
import 'package:ps5_99/features/home/domain/mappers/games_mappers.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

@injectable
class GetGameDetailUsesCase
    extends Interactor<GetGameDetailUsesCaseParams, GameDetailModel> {
  final GameRepository _repository;

  GetGameDetailUsesCase(this._repository);

  @override
  Future<GameDetailModel> doWork(GetGameDetailUsesCaseParams params) async {
    final result = await _repository.getGameDetail(id: params.id);
    return result.toGameDetailModel();
  }
}

class GetGameDetailUsesCaseParams {
  final String id;

  GetGameDetailUsesCaseParams({required this.id});
}
