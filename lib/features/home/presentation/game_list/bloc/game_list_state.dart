part of 'game_list_bloc.dart';

@freezed
class GameListState with _$GameListState {
  const factory GameListState({
    required int? nextPage,
    required Failure? error,
    List<GameModel>? games,
  }) = _GameListState;

  factory GameListState.initial() => const GameListState(
        nextPage: 1,
        error: null,
      );
}
