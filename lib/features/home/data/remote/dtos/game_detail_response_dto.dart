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
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "name_original") String? nameOriginal,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "metacritic") int? metacritic,
    @JsonKey(name: "released") DateTime? released,
    @JsonKey(name: "tba") bool? tba,
    @JsonKey(name: "updated") DateTime? updated,
    @JsonKey(name: "background_image") String? backgroundImage,
    @JsonKey(name: "background_image_additional")
    String? backgroundImageAdditional,
    @JsonKey(name: "website") String? website,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "rating_top") int? ratingTop,
    @JsonKey(name: "added") int? added,
    @JsonKey(name: "playtime") int? playtime,
    @JsonKey(name: "screenshots_count") int? screenshotsCount,
    @JsonKey(name: "movies_count") int? moviesCount,
    @JsonKey(name: "creators_count") int? creatorsCount,
    @JsonKey(name: "achievements_count") int? achievementsCount,
    @JsonKey(name: "parent_achievements_count") int? parentAchievementsCount,
    @JsonKey(name: "reddit_url") String? redditUrl,
    @JsonKey(name: "reddit_name") String? redditName,
    @JsonKey(name: "reddit_description") String? redditDescription,
    @JsonKey(name: "reddit_logo") String? redditLogo,
    @JsonKey(name: "reddit_count") int? redditCount,
    @JsonKey(name: "twitch_count") int? twitchCount,
    @JsonKey(name: "youtube_count") int? youtubeCount,
    @JsonKey(name: "reviews_text_count") int? reviewsTextCount,
    @JsonKey(name: "ratings_count") int? ratingsCount,
    @JsonKey(name: "suggestions_count") int? suggestionsCount,
    @JsonKey(name: "metacritic_url") String? metacriticUrl,
    @JsonKey(name: "parents_count") int? parentsCount,
    @JsonKey(name: "additions_count") int? additionsCount,
    @JsonKey(name: "game_series_count") int? gameSeriesCount,
    @JsonKey(name: "reviews_count") int? reviewsCount,
    @JsonKey(name: "saturated_color") String? saturatedColor,
    @JsonKey(name: "dominant_color") String? dominantColor,
    @JsonKey(name: "genres") List<ItemDto>? genres,
    @JsonKey(name: "description_raw") String? descriptionRaw,
    @JsonKey(name: "developers") List<ItemDto>? developers,
    @JsonKey(name: "publishers") List<ItemDto>? publishers,
    @JsonKey(name: "platforms") List<PlatformDto>? platforms,
    @JsonKey(name: "tags") List<ItemDto>? tags,
  }) = _GameDetailResponseDto;

  factory GameDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GameDetailResponseDtoFromJson(json);
}
