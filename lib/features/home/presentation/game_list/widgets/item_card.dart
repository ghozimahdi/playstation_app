import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                      "Five Nights at Freddy's: Security Breach",
                      style: context.textTheme.bodySmallSemiBold?.copyWith(
                        color: colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      "16 December 2021",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    RatingBarIndicator(
                      rating: 2.75,
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
        Positioned(
          top: -20,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: const ColoredBox(color: colors.gray70),
            ),
          ),
        ),
      ],
    );
  }
}
