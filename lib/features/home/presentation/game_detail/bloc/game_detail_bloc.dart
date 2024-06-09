import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ps5_99/common/failure.dart';
import 'package:ps5_99/common/result.dart';
import 'package:ps5_99/features/home/domain/get_game_detail_usescase.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';

part 'game_detail_bloc.freezed.dart';

part 'game_detail_event.dart';

part 'game_detail_state.dart';

@injectable
class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  final GetGameDetailUsesCase _getGameDetailUsesCase;
  StreamSubscription<int>? _streamSubscription;

  GameDetailBloc(this._getGameDetailUsesCase)
      : super(GameDetailState.initial()) {
    on<GameDetailEvent>(
      (event, emit) async {
        await event.map(
          fetchGameDetail: (e) async {
            emit(state.copyWith(results: none()));

            final result = await _getGameDetailUsesCase(
              GetGameDetailUsesCaseParams(id: e.id),
            );

            result.fold(
              (l) => emit(state.copyWith(results: optionOf(left(l)))),
              (r) {
                emit(state.copyWith(results: optionOf(right(r))));
                add(GameDetailEvent.startSlide(length: r.images.length));
              },
            );
          },
          slideChanged: (v) async {
            emit(state.copyWith(currentIndex: v.currentIndex));
          },
          startSlide: (v) async {
            _streamSubscription?.cancel();
            _streamSubscription = _startSlideShow(v.length).listen(
              (event) {
                add(GameDetailEvent.slideChanged(currentIndex: event));
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Stream<int> _startSlideShow(int length) async* {
    await Future.delayed(const Duration(seconds: 5));
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      int currentIndex = state.currentIndex;
      currentIndex = (currentIndex + 1) % length;
      yield currentIndex;
    }
  }
}
