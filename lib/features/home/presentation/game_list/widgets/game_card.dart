import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/datetime_extensions.dart';
import 'package:ps5_99/common/widgets/app_cached_network_image.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';
import 'package:ps5_99/features/home/domain/model/game_model.dart';

class GameCard extends StatelessWidget {
  final GameModel games;

  const GameCard({
    super.key,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: colors.gray70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: AppCachedNetworkImage(imageUrl: games.imageUrl),
            ),
          ),
          Expanded(child: _buildContentCard(context)),
        ],
      ),
    );
  }

  Widget _buildContentCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                games.name,
                style: context.textTheme.bodySmallSemiBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              4.verticalSpace,
              Text(
                games.released.formatWithLocale(context),
                style: context.textTheme.captionMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              4.verticalSpace,
              Row(
                children: [
                  Text(
                    '${games.rating}',
                    style: context.textTheme.captionMedium,
                  ),
                  2.horizontalSpace,
                  RatingBarIndicator(
                    itemCount: 1,
                    rating: 1,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: colors.yellowOcher,
                    ),
                    unratedColor: colors.white,
                    itemSize: 16,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                color: games.metaCriticColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
              child: Text(
                '${games.metaCriticScore}',
                style: context.textTheme.bodySmallSemiBold?.copyWith(
                  color: colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
