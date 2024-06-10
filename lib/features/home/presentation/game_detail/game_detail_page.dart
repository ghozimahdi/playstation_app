import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart';
import 'package:ps5_99/common/datetime_extensions.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/common/widgets/app_cached_network_image.dart';
import 'package:ps5_99/common/widgets/app_error_card.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';
import 'package:ps5_99/features/home/domain/model/game_detail_model.dart';
import 'package:ps5_99/features/home/presentation/game_detail/bloc/game_detail_bloc.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/dot_indicator.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/game_detail_loading_card.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/genres_card.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/metascore_card.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/platforms_publisher_card.dart';
import 'package:ps5_99/generated/assets.gen.dart';
import 'package:ps5_99/injection.dart';

@RoutePage()
class GameDetailPage extends StatefulWidget {
  final String id;

  const GameDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameDetailBloc>()
        ..add(GameDetailEvent.fetchGameDetail(id: widget.id)),
      child: BlocBuilder<GameDetailBloc, GameDetailState>(
        buildWhen: (previous, current) => previous.results != current.results,
        builder: (BuildContext context, GameDetailState state) {
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: IconButton(
                  icon: SvgPicture.asset(AppAssets.icons.icBack.path),
                  onPressed: () {
                    context.back();
                  },
                ),
              ),
            ),
            body: SafeArea(
              child: state.results.fold(
                //TODO: implement unit testing
                //TODO: implement widget testing
                () => const GameDetailLoadingCard(),
                (a) => a.fold(
                  (l) => AppErrorCard(
                    message: l.message ?? '',
                    image: l.image,
                    onPressed: () {
                      context
                          .read<GameDetailBloc>()
                          .add(GameDetailEvent.fetchGameDetail(id: widget.id));
                    },
                  ),
                  (r) => _buildGameDetailCard(context, r),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameDetailCard(
    BuildContext context,
    GameDetailModel model,
  ) {
    final bloc = context.read<GameDetailBloc>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  padEnds: false,
                  itemCount: model.images.length,
                  onPageChanged: (value) {
                    bloc.add(
                      GameDetailEvent.slideChanged(currentIndex: value),
                    );
                  },
                  itemBuilder: (_, index) => AppCachedNetworkImage(
                    imageUrl: model.images[index],
                  ),
                ),
                BlocConsumer<GameDetailBloc, GameDetailState>(
                  buildWhen: (previous, current) =>
                      previous.currentIndex != current.currentIndex,
                  builder: (_, state) {
                    return Positioned(
                      right: 16,
                      bottom: 16,
                      child: DotIndicator(
                        length: model.images.length,
                        currentIndex: state.currentIndex,
                      ),
                    );
                  },
                  listenWhen: (previous, current) =>
                      previous.currentIndex != current.currentIndex,
                  listener: (BuildContext context, GameDetailState state) {
                    if (_pageController.hasClients) {
                      _pageController.jumpToPage(state.currentIndex);
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: context.textTheme.titleLargeBold,
                ),
                16.verticalSpace,
                RatingBarIndicator(
                  rating: model.rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: colors.yellowOcher,
                  ),
                  itemSize: 20,
                  unratedColor: colors.gray410.withOpacity(0.5),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Text(
                      cw.label_released_on.t,
                      style: context.textTheme.bodyLargeBold,
                    ),
                    Text(
                      model.released.formatWithLocale(context),
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
                16.verticalSpace,
                const Divider(),
                16.verticalSpace,
                MetaScoreCard(
                  reviewsCount: model.reviewsCount,
                  metaCriticScore: model.metaCriticScore,
                  metaCriticColor: model.metaCriticColor,
                ),
                16.verticalSpace,
                Text(
                  parse(model.description).body?.text ?? '',
                  style: context.textTheme.bodySmall,
                ),
                16.verticalSpace,
                PlatformsPublisherCard(
                  platforms: model.platforms,
                  publisher: model.publisher,
                  developer: model.developer,
                ),
                16.verticalSpace,
                GenresCard(
                  genres: model.genres,
                ),
                24.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
