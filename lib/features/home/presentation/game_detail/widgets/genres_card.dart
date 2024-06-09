import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

class GenresCard extends StatelessWidget {
  final List<String> genres;

  const GenresCard({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.gray70,
      padding: EdgeInsets.all(12.dm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres: ',
            style: context.textTheme.bodyLargeBold,
          ),
          Expanded(
            child: Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                ...genres.map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: colors.gray410,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: Text(
                      e,
                      style: context.textTheme.captionMedium
                          ?.copyWith(color: colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
