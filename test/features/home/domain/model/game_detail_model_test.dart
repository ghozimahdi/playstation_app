import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';

void main() {
  group('GameDetailModel', () {
    final DateTime releaseDate = DateTime(2021, 11, 11);
    const Color metaCriticColor = Color(0xFF00FF00);
    final List<String> genres = ['Action', 'Adventure'];
    final List<String> images = ['image1.jpg', 'image2.jpg'];

    final GameDetailModel gameDetail = GameDetailModel(
      id: '1',
      name: 'Example Game',
      description: 'This is a description of the example game.',
      rating: 4.5,
      released: releaseDate,
      metaCriticScore: 85,
      metaCriticColor: metaCriticColor,
      reviewsCount: 100,
      genres: genres,
      images: images,
      platforms: 'PC, PS5',
      developer: 'Example Developer',
      publisher: 'Example Publisher',
    );

    test('should create a GameDetailModel instance and verify properties', () {
      expect(gameDetail.id, '1');
      expect(gameDetail.name, 'Example Game');
      expect(
        gameDetail.description,
        'This is a description of the example game.',
      );
      expect(gameDetail.rating, 4.5);
      expect(gameDetail.released, releaseDate);
      expect(gameDetail.metaCriticScore, 85);
      expect(gameDetail.metaCriticColor, metaCriticColor);
      expect(gameDetail.reviewsCount, 100);
      expect(gameDetail.genres, genres);
      expect(gameDetail.images, images);
      expect(gameDetail.platforms, 'PC, PS5');
      expect(gameDetail.developer, 'Example Developer');
      expect(gameDetail.publisher, 'Example Publisher');
    });

    test('should compare two identical GameDetailModel instances as equal', () {
      final GameDetailModel anotherGameDetail = GameDetailModel(
        id: '1',
        name: 'Example Game',
        description: 'This is a description of the example game.',
        rating: 4.5,
        released: releaseDate,
        metaCriticScore: 85,
        metaCriticColor: metaCriticColor,
        reviewsCount: 100,
        genres: genres,
        images: images,
        platforms: 'PC, PS5',
        developer: 'Example Developer',
        publisher: 'Example Publisher',
      );

      expect(gameDetail, equals(anotherGameDetail));
    });

    test('should create a GameDetailModel instance with empty fields', () {
      final emptyGameDetail = GameDetailModel(
        id: '',
        name: '',
        description: '',
        rating: 0.0,
        released: DateTime(0),
        metaCriticScore: 0,
        metaCriticColor: const Color(0x00000000),
        reviewsCount: 0,
        genres: [],
        images: [],
        platforms: '',
        developer: '',
        publisher: '',
      );

      expect(emptyGameDetail.id, '');
      expect(emptyGameDetail.name, '');
      expect(emptyGameDetail.description, '');
      expect(emptyGameDetail.rating, 0.0);
      expect(emptyGameDetail.released, DateTime(0));
      expect(emptyGameDetail.metaCriticScore, 0);
      expect(emptyGameDetail.metaCriticColor, const Color(0x00000000));
      expect(emptyGameDetail.reviewsCount, 0);
      expect(emptyGameDetail.genres, []);
      expect(emptyGameDetail.images, []);
      expect(emptyGameDetail.platforms, '');
      expect(emptyGameDetail.developer, '');
      expect(emptyGameDetail.publisher, '');
    });
  });
}
