import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5_99/app_router.gr.dart';
import 'package:ps5_99/features/splash/cubit/splash_cubit.dart';
import 'package:ps5_99/injection.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (BuildContext context, state) {
          if (state == const SplashState.completion()) {
            context.pushRoute(const GameListRoute());
          }
        },
        listenWhen: (previous, current) => previous != current,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
