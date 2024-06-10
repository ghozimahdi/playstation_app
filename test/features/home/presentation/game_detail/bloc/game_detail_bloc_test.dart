import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/common/failure.dart';
import 'package:ps5_99/features/home/domain/get_game_detail_usescase.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';
import 'package:ps5_99/features/home/presentation/game_detail/bloc/game_detail_bloc.dart';

import 'game_detail_bloc_test.mocks.dart';

@GenerateMocks([GetGameDetailUsesCase])
void main() {
  late MockGetGameDetailUsesCase mockGetGameDetailUsesCase;
  late GameDetailBloc bloc;

  setUp(() {
    mockGetGameDetailUsesCase = MockGetGameDetailUsesCase();
    bloc = GameDetailBloc(mockGetGameDetailUsesCase);
  });

  final testGameDetailModel = GameDetailModel(
    id: '1',
    name: 'Test Game',
    description: 'Description',
    rating: 4.5,
    released: DateTime(2021, 11, 11),
    metaCriticScore: 85,
    metaCriticColor: const Color(0xFF00FF00),
    reviewsCount: 100,
    genres: ['Action'],
    images: ['https://example.com/image1.png'],
    platforms: 'PC',
    developer: 'Test Developer',
    publisher: 'Test Publisher',
  );

  group('GameDetailBloc', () {
    blocTest<GameDetailBloc, GameDetailState>(
      'emits [GameDetailState] with results when fetchGameDetail is successful',
      build: () {
        when(mockGetGameDetailUsesCase(any)).thenAnswer(
          (_) async => Right(testGameDetailModel),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const GameDetailEvent.fetchGameDetail(id: '1')),
      expect: () => [
        GameDetailState.initial().copyWith(results: none()),
        GameDetailState.initial().copyWith(
          results: some(Right(testGameDetailModel)),
        ),
      ],
    );

    blocTest<GameDetailBloc, GameDetailState>(
      'emits [GameDetailState] with failure when fetchGameDetail fails',
      build: () {
        when(mockGetGameDetailUsesCase(any)).thenAnswer(
          (_) async => const Left(Failure()),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const GameDetailEvent.fetchGameDetail(id: '1')),
      expect: () => [
        GameDetailState.initial().copyWith(results: none()),
        GameDetailState.initial().copyWith(
          results: some(const Left(Failure())),
        ),
      ],
    );

    blocTest<GameDetailBloc, GameDetailState>(
      'emits [GameDetailState] with updated currentIndex when slideChanged is added',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const GameDetailEvent.slideChanged(currentIndex: 2)),
      expect: () => [
        GameDetailState.initial().copyWith(currentIndex: 2),
      ],
    );
  });
}
