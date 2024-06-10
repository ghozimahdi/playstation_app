import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

class MetaScoreCard extends StatelessWidget {
  final int reviewsCount;
  final int metaCriticScore;
  final Color metaCriticColor;

  const MetaScoreCard({
    super.key,
    required this.reviewsCount,
    required this.metaCriticScore,
    required this.metaCriticColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cw.label_meta_score.t,
                    style: context.textTheme.bodySmall?.copyWith(
                      letterSpacing: 3,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    cw.text_base_on_critic.tr(
                      args: [
                        '$reviewsCount',
                      ],
                    ),
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: metaCriticColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Center(
                  child: Text(
                    '$metaCriticScore',
                    style: context.textTheme.titleLargeBold?.copyWith(
                      color: colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Container(
          height: 4.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: metaCriticColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ],
    );
  }
}
