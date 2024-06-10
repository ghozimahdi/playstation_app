// TODO: add dummy json
// TODO: add class model

import 'package:ps5_99/features/home/data/remote/dtos/game_detail_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/game_response_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/item_dto.dart';
import 'package:ps5_99/features/home/data/remote/dtos/platform_dto.dart';

mixin DummyData {
  static final platformDtoJson = {
    "platform": {
      "id": 1,
      "name": "PC",
      'image_background': 'http://example.com/image.jpg',
    },
  };

  static const platformDto = PlatformDto(
    platform: ItemDto(
      id: 1,
      name: "PC",
      imageBackground: 'http://example.com/image.jpg',
    ),
  );

  static final gameResponseJson = {
    'id': 1,
    'name': 'Game 1',
    'released': '2021-11-11T00:00:00.000',
    'rating': 4.5,
    'background_image': 'http://example.com/image.jpg',
    "metacritic": 85,
  };

  static final List<Map<String, dynamic>> gameListResponseJson = [
    {
      "id": 1,
      "name": "Game 1",
      "rating": 4.5,
      "released": "2021-11-11T00:00:00.000",
      'background_image': 'http://example.com/image.jpg',
      "metacritic": 85,
    },
    {
      "id": 2,
      "name": "Game 2",
      "rating": 4.0,
      "released": "2021-11-11T00:00:00.000",
      'background_image': 'http://example.com/image.jpg',
      "metacritic": 85,
    },
  ];

  static final Map<String, dynamic> gameDetailResponseJson = {
    "id": 1,
    "name": "Game 1",
    "description": "Description of Game 1",
    "rating": 4.5,
    "released": "2021-11-11",
    "metacritic": 85,
    "genres": [
      {
        "id": 1,
        "name": "Action",
        'image_background': 'http://example.com/image.jpg',
      },
    ],
    "developers": [
      {
        "id": 1,
        "name": "Dev 1",
        'image_background': 'http://example.com/image.jpg',
      },
    ],
    "publishers": [
      {
        "id": 1,
        "name": "Pub 1",
        'image_background': 'http://example.com/image.jpg',
      },
    ],
    "platforms": [
      {
        "platform": {
          "id": 1,
          "name": "PC",
          "image_background": "https://example.com/image1.png",
        },
      },
    ],
    "tags": [
      {
        "id": 1,
        "name": "Tag 1",
        'image_background': 'http://example.com/image.jpg',
      },
    ],
  };

  static final gameResponseDto = GameResponseDto(
    id: 1,
    name: 'Game 1',
    rating: 4.5,
    released: DateTime.parse("2021-11-11T00:00:00.000"),
    metacritic: 85,
    backgroundImage: 'http://example.com/image.jpg',
  );

  static final List<GameResponseDto> gameListResponseDto = [
    GameResponseDto(
      id: 1,
      name: 'Game 1',
      rating: 4.5,
      released: DateTime.parse("2021-11-11T00:00:00.000"),
      metacritic: 85,
      backgroundImage: 'http://example.com/image.jpg',
    ),
    GameResponseDto(
      id: 2,
      name: 'Game 2',
      rating: 4.0,
      released: DateTime.parse("2021-11-11T00:00:00.000"),
      metacritic: 85,
      backgroundImage: 'http://example.com/image.jpg',
    ),
  ];

  static final GameDetailResponseDto gameDetailResponseDto =
      GameDetailResponseDto(
    id: 1,
    name: 'Game 1',
    description: 'Description of Game 1',
    rating: 4.5,
    released: DateTime(2021, 11, 11),
    metacritic: 85,
    genres: [
      const ItemDto(
        id: 1,
        name: 'Action',
        imageBackground: 'http://example.com/image.jpg',
      ),
    ],
    developers: [
      const ItemDto(
        id: 1,
        name: 'Dev 1',
        imageBackground: 'http://example.com/image.jpg',
      ),
    ],
    publishers: [
      const ItemDto(
        id: 1,
        name: 'Pub 1',
        imageBackground: 'http://example.com/image.jpg',
      ),
    ],
    platforms: [
      const PlatformDto(
        platform: ItemDto(
          id: 1,
          name: 'PC',
          imageBackground: 'https://example.com/image1.png',
        ),
      ),
    ],
    tags: [
      const ItemDto(
        id: 1,
        name: 'Tag 1',
        imageBackground: 'http://example.com/image.jpg',
      ),
    ],
  );
}
