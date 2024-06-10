import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ps5_99/features/home/domain/get_game_detail_usescase.dart';
import 'package:ps5_99/features/home/domain/mappers/games_mappers.dart';
import 'package:ps5_99/features/home/domain/repository/game_repository.dart';

import '../../../dummy_data.dart';
import 'get_game_detail_usescase_test.mocks.dart';

@GenerateMocks([GameRepository])
void main() {
  late GetGameDetailUsesCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = GetGameDetailUsesCase(mockRepository);
  });
  final gameDetailModel = DummyData.gameDetailResponseDto.toGameDetailModel();

  test('should get data from the repository', () async {
    when(mockRepository.getGameDetail(id: anyNamed('id'))).thenAnswer(
      (_) async => DummyData.gameDetailResponseDto,
    );

    final result = await useCase.doWork(GetGameDetailUsesCaseParams(id: '1'));

    verify(mockRepository.getGameDetail(id: '1'));
    expect(result, gameDetailModel);
  });
}
