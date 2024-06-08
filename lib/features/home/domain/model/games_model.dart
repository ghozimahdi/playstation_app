import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_model.freezed.dart';

@freezed
class GamesModel with _$GamesModel {
  const factory GamesModel({
    required String id,
    required String imageUrl,
    required String name,
    required DateTime released,
    required double rating,
  }) = _GamesModel;
}
