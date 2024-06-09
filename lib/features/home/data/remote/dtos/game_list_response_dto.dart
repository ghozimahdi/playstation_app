import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_list_response_dto.freezed.dart';
part 'game_list_response_dto.g.dart';

@freezed
class GameListResponseDto with _$GameListResponseDto {
  const GameListResponseDto._();

  const factory GameListResponseDto({
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "playtime") int? playtime,
    @JsonKey(name: "released") DateTime? released,
    @JsonKey(name: "tba") bool? tba,
    @JsonKey(name: "background_image") String? backgroundImage,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "rating_top") int? ratingTop,
    @JsonKey(name: "ratings_count") int? ratingsCount,
    @JsonKey(name: "reviews_text_count") int? reviewsTextCount,
    @JsonKey(name: "added") int? added,
    @JsonKey(name: "metacritic") int? metacritic,
    @JsonKey(name: "suggestions_count") int? suggestionsCount,
    @JsonKey(name: "updated") DateTime? updated,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    @JsonKey(name: "saturated_color") String? saturatedColor,
    @JsonKey(name: "dominant_color") String? dominantColor,
    @JsonKey(name: "community_rating") int? communityRating,
  }) = _GameListResponseDto;

  factory GameListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GameListResponseDtoFromJson(json);
}
