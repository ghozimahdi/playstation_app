import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';

import '../../../../../dummy_data.dart';

void main() {
  group('GameDetailResponseDto', () {
    Map<String, dynamic> toJson(GameDetailResponseDto dto) {
      return {
        'id': dto.id,
        'name': dto.name,
        'description': dto.description,
        'rating': dto.rating,
        'released': dto.released?.toIso8601String().split('T')[0],
        'metacritic': dto.metacritic,
        'genres': dto.genres?.map((item) => item.toJson()).toList(),
        'developers': dto.developers?.map((item) => item.toJson()).toList(),
        'publishers': dto.publishers?.map((item) => item.toJson()).toList(),
        'platforms': dto.platforms
            ?.map(
              (item) => {
                'platform': item.platform?.toJson(),
              },
            )
            .toList(),
        'tags': dto.tags?.map((item) => item.toJson()).toList(),
      };
    }

    test('should convert from JSON to DTO', () {
      final result =
          GameDetailResponseDto.fromJson(DummyData.gameDetailResponseJson);
      expect(result, DummyData.gameDetailResponseDto);
    });

    test('should convert from DTO to JSON', () {
      final result = toJson(DummyData.gameDetailResponseDto);
      expect(result, DummyData.gameDetailResponseJson);
    });
  });
}
