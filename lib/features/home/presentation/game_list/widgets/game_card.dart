import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/datetime_extensions.dart';
import 'package:ps5_99/common/widgets/app_shimmer.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';
import 'package:ps5_99/features/home/domain/model/games_model.dart';
import 'package:ps5_99/generated/assets.gen.dart';

class GameCard extends StatelessWidget {
  final GamesModel games;

  const GameCard({
    super.key,
    required this.games,
  });

  static Widget placeholder() {
    return AppShimmer(
      child: AspectRatio(
        aspectRatio: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: const ColoredBox(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: const LinearGradient(
                colors: [
                  colors.secondary,
                  colors.primary,
                ],
                stops: [0.01, 1.0],
              ),
            ),
            padding: EdgeInsets.only(top: 8.h, bottom: 20.h, right: 8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                130.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        games.name,
                        style: context.textTheme.bodySmallSemiBold?.copyWith(
                          color: colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      4.verticalSpace,
                      Text(
                        games.released.formatWithLocale(context),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      4.verticalSpace,
                      RatingBarIndicator(
                        rating: games.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        unratedColor: colors.white,
                        itemSize: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: ColoredBox(
              color: colors.gray70,
              child: CachedNetworkImage(
                width: 100.w,
                height: 100.h,
                imageUrl: games.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: colors.secondary,
                    backgroundColor: colors.secondary.withOpacity(0.2),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: double.infinity,
                  color: colors.white,
                  child: Image.asset(AppAssets.images.img404.path),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
