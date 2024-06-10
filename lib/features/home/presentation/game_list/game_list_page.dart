import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ps5_99/app_router.gr.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/common/widgets/app_error_card.dart';
import 'package:ps5_99/common/widgets/app_shimmer.dart';
import 'package:ps5_99/design_system/typography_extension.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';
import 'package:ps5_99/features/home/presentation/game_list/bloc/game_list_bloc.dart';
import 'package:ps5_99/features/home/presentation/game_list/widgets/app_paged_grid_view.dart';
import 'package:ps5_99/features/home/presentation/game_list/widgets/game_card.dart';
import 'package:ps5_99/injection.dart';

@RoutePage()
class GameListPage extends StatefulWidget {
  const GameListPage({super.key});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  final PagingController<int, GameModel> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 3);

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GameListBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: 45.dm,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: SearchBar(
                            hintText: cw.hint_search.t,
                            trailing: const [
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Text(
                      cw.title_popular_games.t,
                      style: context.textTheme.bodyLargeSemiBold,
                    ),
                    Expanded(child: _buildGameListCard(context)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameListCard(BuildContext context) {
    final gameListBloc = context.read<GameListBloc>();
    return BlocListener<GameListBloc, GameListState>(
      listenWhen: (previous, current) =>
          previous.games != current.games || previous.error != current.error,
      listener: (context, state) {
        _pagingController.value = PagingState(
          nextPageKey: state.nextPage,
          itemList: state.games,
          error: state.error,
        );
      },
      child: AppPagedGridView<int, GameModel>(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.67,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        pagingController: _pagingController,
        pageRequest: (pageKey) {
          gameListBloc.add(
            GameListEvent.fetchGames(page: pageKey),
          );
        },
        itemBuilder: (context, item, _) => InkWell(
          child: GameCard(
            games: item,
          ),
          onTap: () {
            context.pushRoute(
              GameDetailRoute(
                id: item.id,
              ),
            );
          },
        ),
        firstPageProgressIndicatorBuilder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                20,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      const Expanded(
                        child: AspectRatio(
                          aspectRatio: 0.67,
                          child: AppShimmer(),
                        ),
                      ),
                      10.horizontalSpace,
                      const Expanded(
                        child: AspectRatio(
                          aspectRatio: 0.67,
                          child: AppShimmer(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        newPageProgressIndicatorBuilder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 15.dm,
            ),
            child: const AppShimmer(),
          );
        },
        firstPageErrorIndicatorBuilder: (context) => AppErrorCard(
          message: gameListBloc.state.error?.message ?? '',
          image: gameListBloc.state.error?.image,
          onPressed: () {
            _pagingController.refresh();
          },
        ),
      ),
    );
  }
}
