import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/common/failure.dart';
import 'package:ps5_99/features/home/domain/get_game_list_usescase.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';
import 'package:ps5_99/features/home/presentation/game_list/bloc/game_list_bloc.dart';

import 'game_list_bloc_test.mocks.dart';

@GenerateMocks([GetGameListUsesCase])
void main() {
  late MockGetGameListUsesCase mockGetGameListUsesCase;
  late GameListBloc bloc;

  setUp(() {
    mockGetGameListUsesCase = MockGetGameListUsesCase();
    bloc = GameListBloc(mockGetGameListUsesCase);
  });

  final testGameModels = [
    GameModel(
      id: '1',
      imageUrl: 'https://example.com/image1.png',
      name: 'Test Game 1',
      released: DateTime(2021, 11, 11),
      rating: 4.5,
      metaCriticScore: 85,
      metaCriticColor: const Color(0xFF00FF00),
    ),
    GameModel(
      id: '2',
      imageUrl: 'https://example.com/image2.png',
      name: 'Test Game 2',
      released: DateTime(2021, 12, 12),
      rating: 4.0,
      metaCriticScore: 80,
      metaCriticColor: const Color(0xFF00FF00),
    ),
  ];

  group('GameListBloc', () {
    blocTest<GameListBloc, GameListState>(
      'emits [GameListState] with games when fetchGames is successful for page 1',
      build: () {
        when(mockGetGameListUsesCase(any)).thenAnswer(
          (_) async => Right(testGameModels),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const GameListEvent.fetchGames()),
      expect: () => [
        GameListState.initial().copyWith(games: null, error: null),
        GameListState.initial().copyWith(
          games: testGameModels,
          nextPage: 2,
        ),
      ],
    );

    blocTest<GameListBloc, GameListState>(
      'emits [GameListState] with failure when fetchGames fails',
      build: () {
        when(mockGetGameListUsesCase(any)).thenAnswer(
          (_) async => const Left(Failure()),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const GameListEvent.fetchGames()),
      expect: () => [
        GameListState.initial().copyWith(games: null, error: null),
        GameListState.initial().copyWith(
          error: const Failure(),
          nextPage: null,
        ),
      ],
    );
  });
}
