import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_response_dto.dart';

import '../../../../../dummy_data.dart';

void main() {
  group('GameListResponseDto', () {
    test('should convert from JSON to DTO', () {
      final result = GameResponseDto.fromJson(DummyData.gameResponseJson);
      expect(result, DummyData.gameResponseDto);
    });

    test('should convert from DTO to JSON', () {
      final result = DummyData.gameResponseDto.toJson();
      expect(result, DummyData.gameResponseJson);
    });
  });
}
