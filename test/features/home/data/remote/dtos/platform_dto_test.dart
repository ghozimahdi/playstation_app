import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/home/data/remote/dtos/platform_dto.dart';

import '../../../../../dummy_data.dart';

void main() {
  group('PlatformDto', () {
    Map<String, dynamic> toJson(PlatformDto dto) {
      return {
        "platform": dto.platform?.toJson(),
      };
    }

    test('should convert from JSON to DTO', () {
      final result = PlatformDto.fromJson(DummyData.platformDtoJson);
      expect(result, DummyData.platformDto);
    });

    test('should convert from DTO to JSON', () {
      final result = toJson(DummyData.platformDto);
      expect(result, DummyData.platformDtoJson);
    });
  });
}
