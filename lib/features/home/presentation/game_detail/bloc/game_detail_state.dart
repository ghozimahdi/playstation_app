part of 'game_detail_bloc.dart';

@freezed
class GameDetailState with _$GameDetailState {
  const factory GameDetailState({
    required Option<Result<GameDetailModel>> results,
    required int currentIndex,
  }) = _GameDetailState;

  factory GameDetailState.initial() => GameDetailState(
        results: none(),
        currentIndex: 0,
      );
}
