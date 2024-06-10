import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_response_dto.freezed.dart';

part 'game_response_dto.g.dart';

@freezed
class GameResponseDto with _$GameResponseDto {
  const GameResponseDto._();

  const factory GameResponseDto({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "released") DateTime? released,
    @JsonKey(name: "background_image") String? backgroundImage,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "metacritic") int? metacritic,
  }) = _GameResponseDto;

  factory GameResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GameResponseDtoFromJson(json);
}
