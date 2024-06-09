import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ps5_99/features/home/data/remote/dtos/item_dto.dart';

part 'platform_dto.freezed.dart';

part 'platform_dto.g.dart';

@freezed
class PlatformDto with _$PlatformDto {
  const PlatformDto._();

  const factory PlatformDto({
    @JsonKey(name: "platform") ItemDto? platform,
  }) = _PlatformDto;

  factory PlatformDto.fromJson(Map<String, dynamic> json) =>
      _$PlatformDtoFromJson(json);
}
