part of 'game_list_bloc.dart';

@freezed
class GameListEvent with _$GameListEvent {
  const factory GameListEvent.fetchGames({
    @Default(1) int page,
  }) = _FetchGames;
}
