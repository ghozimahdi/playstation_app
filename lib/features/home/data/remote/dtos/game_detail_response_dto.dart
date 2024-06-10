import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ps5_99/features/home/data/remote/dtos/item_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/platform_dto.dart';

part 'game_detail_response_dto.freezed.dart';
part 'game_detail_response_dto.g.dart';

@freezed
class GameDetailResponseDto with _$GameDetailResponseDto {
  const GameDetailResponseDto._();

  const factory GameDetailResponseDto({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "metacritic") int? metacritic,
    @JsonKey(name: "released") DateTime? released,
    @JsonKey(name: "background_image") String? backgroundImage,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    @JsonKey(name: "genres") List<ItemDto>? genres,
    @JsonKey(name: "developers") List<ItemDto>? developers,
    @JsonKey(name: "publishers") List<ItemDto>? publishers,
    @JsonKey(name: "platforms") List<PlatformDto>? platforms,
    @JsonKey(name: "tags") List<ItemDto>? tags,
  }) = _GameDetailResponseDto;

  factory GameDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GameDetailResponseDtoFromJson(json);
}
