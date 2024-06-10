import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';

void main() {
  group('GamesModel', () {
    final DateTime releaseDate = DateTime(2020, 10, 10);
    const Color metaCriticColor = Color(0xFF00FF00);
    final GameModel gamesModel = GameModel(
      id: '1',
      imageUrl: 'http://example.com/image.jpg',
      name: 'Example Game',
      released: releaseDate,
      rating: 4.5,
      metaCriticScore: 85,
      metaCriticColor: metaCriticColor,
    );

    test('should create a GamesModel instance and verify properties', () {
      expect(gamesModel.id, '1');
      expect(gamesModel.imageUrl, 'http://example.com/image.jpg');
      expect(gamesModel.name, 'Example Game');
      expect(gamesModel.released, releaseDate);
      expect(gamesModel.rating, 4.5);
      expect(gamesModel.metaCriticScore, 85);
      expect(gamesModel.metaCriticColor, metaCriticColor);
    });

    test('should compare two identical GamesModel instances as equal', () {
      final GameModel anotherGamesModel = GameModel(
        id: '1',
        imageUrl: 'http://example.com/image.jpg',
        name: 'Example Game',
        released: releaseDate,
        rating: 4.5,
        metaCriticScore: 85,
        metaCriticColor: metaCriticColor,
      );

      expect(gamesModel, equals(anotherGamesModel));
    });

    test('should create a GamesModel instance with empty and invalid fields',
        () {
      final invalidGamesModel = GameModel(
        id: '',
        imageUrl: '',
        name: '',
        released: DateTime(0),
        rating: -1.0,
        metaCriticScore: -1,
        metaCriticColor: const Color(0x00000000),
      );

      expect(invalidGamesModel.id, '');
      expect(invalidGamesModel.imageUrl, '');
      expect(invalidGamesModel.name, '');
      expect(invalidGamesModel.released, DateTime(0));
      expect(invalidGamesModel.rating, -1.0);
      expect(invalidGamesModel.metaCriticScore, -1);
      expect(invalidGamesModel.metaCriticColor, const Color(0x00000000));
    });
  });
}
