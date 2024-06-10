import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String imageUrl,
    required String name,
    required DateTime released,
    required double rating,
    required int metaCriticScore,
    required Color metaCriticColor,
  }) = _GameModel;
}
