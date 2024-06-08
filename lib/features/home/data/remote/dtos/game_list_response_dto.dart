import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_list_response_dto.freezed.dart';
part 'game_list_response_dto.g.dart';

@freezed
class GameListResponseDto with _$GameListResponseDto {
  const GameListResponseDto._();

  const factory GameListResponseDto({
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "next") String? next,
    @JsonKey(name: "previous") dynamic previous,
    @JsonKey(name: "results") List<ResultDto>? results,
    @JsonKey(name: "user_platforms") bool? userPlatforms,
  }) = _GameListResponseDto;

  factory GameListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GameListResponseDtoFromJson(json);
}

@freezed
class ResultDto with _$ResultDto {
  const factory ResultDto({
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "playtime") int? playtime,
    @JsonKey(name: "platforms") List<Platform>? platforms,
    @JsonKey(name: "stores") List<Store>? stores,
    @JsonKey(name: "released") DateTime? released,
    @JsonKey(name: "tba") bool? tba,
    @JsonKey(name: "background_image") String? backgroundImage,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "rating_top") int? ratingTop,
    @JsonKey(name: "ratings") List<Rating>? ratings,
    @JsonKey(name: "ratings_count") int? ratingsCount,
    @JsonKey(name: "reviews_text_count") int? reviewsTextCount,
    @JsonKey(name: "added") int? added,
    @JsonKey(name: "added_by_status") AddedByStatus? addedByStatus,
    @JsonKey(name: "metacritic") int? metacritic,
    @JsonKey(name: "suggestions_count") int? suggestionsCount,
    @JsonKey(name: "updated") DateTime? updated,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "score") dynamic score,
    @JsonKey(name: "clip") dynamic clip,
    @JsonKey(name: "tags") List<Tag>? tags,
    @JsonKey(name: "esrb_rating") EsrbRating? esrbRating,
    @JsonKey(name: "user_game") dynamic userGame,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    @JsonKey(name: "saturated_color") String? saturatedColor,
    @JsonKey(name: "dominant_color") String? dominantColor,
    @JsonKey(name: "short_screenshots") List<ShortScreenshot>? shortScreenshots,
    @JsonKey(name: "parent_platforms") List<Platform>? parentPlatforms,
    @JsonKey(name: "genres") List<Genre>? genres,
    @JsonKey(name: "community_rating") int? communityRating,
  }) = _ResultDto;

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);
}

@freezed
class AddedByStatus with _$AddedByStatus {
  const factory AddedByStatus({
    @JsonKey(name: "yet") int? yet,
    @JsonKey(name: "owned") int? owned,
    @JsonKey(name: "beaten") int? beaten,
    @JsonKey(name: "toplay") int? toplay,
    @JsonKey(name: "dropped") int? dropped,
    @JsonKey(name: "playing") int? playing,
  }) = _AddedByStatus;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) =>
      _$AddedByStatusFromJson(json);
}

@freezed
class EsrbRating with _$EsrbRating {
  const factory EsrbRating({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name_en") String? nameEn,
    @JsonKey(name: "name_ru") String? nameRu,
  }) = _EsrbRating;

  factory EsrbRating.fromJson(Map<String, dynamic> json) =>
      _$EsrbRatingFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class Platform with _$Platform {
  const factory Platform({
    @JsonKey(name: "platform") Genre? platform,
  }) = _Platform;

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "percent") double? percent,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class ShortScreenshot with _$ShortScreenshot {
  const factory ShortScreenshot({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "image") String? image,
  }) = _ShortScreenshot;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenshotFromJson(json);
}

@freezed
class Store with _$Store {
  const factory Store({
    @JsonKey(name: "store") Genre? store,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "language") String? language,
    @JsonKey(name: "games_count") int? gamesCount,
    @JsonKey(name: "image_background") String? imageBackground,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
