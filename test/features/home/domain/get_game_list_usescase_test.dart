import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/features/home/domain/get_game_list_usescase.dart';
import 'package:ps5_99/features/home/domain/mappers/games_mappers.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

import '../../../dummy_data.dart';
import 'get_game_list_usescase_test.mocks.dart';

@GenerateMocks([GameRepository])
void main() {
  late GetGameListUsesCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = GetGameListUsesCase(mockRepository);
  });

  final gameListModel = DummyData.gameListResponseDto.toGameListModel();

  test('should get data from the repository', () async {
    when(mockRepository.getGameList(page: anyNamed('page'))).thenAnswer(
      (_) async => DummyData.gameListResponseDto,
    );

    final result = await useCase.doWork(GetGameListUsesCaseParams(page: 1));

    verify(mockRepository.getGameList(page: 1));
    expect(result, gameListModel);
  });
}
