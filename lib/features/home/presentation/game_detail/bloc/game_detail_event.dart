part of 'game_detail_bloc.dart';

@freezed
class GameDetailEvent with _$GameDetailEvent {
  const factory GameDetailEvent.fetchGameDetail({
    required String id,
  }) = _FetchGameDetail;

  const factory GameDetailEvent.slideChanged({
    required int currentIndex,
  }) = _SlideChanged;

  const factory GameDetailEvent.startSlide({
    required int length,
  }) = _StartSlide;
}
