import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_detail_model.freezed.dart';

@freezed
class GameDetailModel with _$GameDetailModel {
  const factory GameDetailModel({
    required String id,
    required String name,
    required String description,
    required double rating,
    required DateTime released,
    required int metaCriticScore,
    required Color metaCriticColor,
    required int reviewsCount,
    required List<String> genres,
    required List<String> images,
    required String platforms,
    required String developer,
    required String publisher,
  }) = _GameDetailModel;
}
