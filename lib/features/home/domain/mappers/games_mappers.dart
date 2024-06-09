import 'package:flutter/material.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_list_response_dto.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';
import 'package:ps5_99/features/home/domain/model/games_model.dart';

extension GamesMappers on List<GameListResponseDto> {
  List<GamesModel> toGameListModel() {
    return map((e) => e.toGamesModel()).toList();
  }
}

extension GameListResponseDtoMapper on GameListResponseDto {
  GamesModel toGamesModel() {
    return GamesModel(
      imageUrl: backgroundImage ?? '',
      name: name ?? '',
      released: released ?? DateTime.now(),
      rating: rating ?? 0,
      id: '${id ?? ''}',
      metaCriticScore: metacritic ?? 0,
      metaCriticColor: _getScoreColor(metacritic ?? 0),
    );
  }
}

Color _getScoreColor(int score) {
  if (score >= 75) return colors.green;
  if (score >= 50) return colors.yellow;
  return colors.red;
}

extension GameDetailResponseMapper on GameDetailResponseDto {
  GameDetailModel toGameDetailModel() {
    final genreNames = genres?.map((e) => e.name ?? '').toList();
    final platformNames =
        platforms?.map((e) => e.platform?.name ?? '').toList();
    final developerNames = developers?.map((e) => e.name ?? '').toList();
    final publisherNames = publishers?.map((e) => e.name ?? '').toList();
    final screenshots =
        tags?.take(5).map((e) => e.imageBackground ?? '').toList();

    return GameDetailModel(
      id: '${id ?? 0}',
      name: name ?? '',
      description: description ?? '',
      released: released ?? DateTime.now(),
      metaCriticScore: metacritic ?? 0,
      reviewsCount: reviewsCount ?? 0,
      metaCriticColor: _getScoreColor(metacritic ?? 0),
      rating: rating ?? 0,
      genres: [...?genreNames],
      images: [backgroundImage ?? '', ...?screenshots],
      platforms: platformNames?.join(', ') ?? '-',
      developer: developerNames?.join(', ') ?? '-',
      publisher: publisherNames?.join(', ') ?? '-',
    );
  }
}
