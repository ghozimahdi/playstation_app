import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/common/failure.dart';
import 'package:ps5_99/features/home/domain/get_game_list_usescase.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';

part 'game_list_bloc.freezed.dart';

part 'game_list_event.dart';

part 'game_list_state.dart';

@injectable
class GameListBloc extends Bloc<GameListEvent, GameListState> {
  final GetGameListUsesCase _getGameListUseCase;

  GameListBloc(this._getGameListUseCase) : super(GameListState.initial()) {
    on<GameListEvent>((event, emit) async {
      await event.map(
        fetchGames: (e) async {
          emit(
            state.copyWith(
              games: (e.page == 1) ? null : state.games,
              error: null,
            ),
          );

          final result = await _getGameListUseCase(
            GetGameListUsesCaseParams(
              page: e.page,
            ),
          );

          emit(
            result.fold(
              (l) => state.copyWith(
                error: l,
                nextPage: null,
              ),
              (r) => state.copyWith(
                games: (e.page == 1) ? r : (state.games ?? []) + r,
                nextPage: (r.isEmpty) ? null : e.page + 1,
              ),
            ),
          );
        },
      );
    });
  }
}
