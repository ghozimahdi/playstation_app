import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    }).then((value) {
      emit(const SplashState.completion());
    });
  }
}
