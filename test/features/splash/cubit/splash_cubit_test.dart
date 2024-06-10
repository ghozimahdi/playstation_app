import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/features/splash/cubit/splash_cubit.dart';

void main() {
  group('SplashCubit', () {
    late SplashCubit splashCubit;

    setUp(() {
      splashCubit = SplashCubit();
    });

    tearDown(() {
      splashCubit.close();
    });

    test('initial state is SplashState.initial', () {
      expect(splashCubit.state, const SplashState.initial());
    });

    blocTest<SplashCubit, SplashState>(
      'emits [SplashState.completion] when init is called',
      build: () => splashCubit,
      act: (cubit) async {
        await cubit.init();
      },
      expect: () => [
        const SplashState.completion(),
      ],
    );
  });
}
