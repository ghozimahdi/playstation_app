import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/widgets/app_shimmer.dart';

class GameDetailLoadingCard extends StatelessWidget {
  const GameDetailLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(
            aspectRatio: 1.1,
            child: AppShimmer(),
          ),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.all(16.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceWidth / 1.5,
                  height: 50.h,
                  child: const AppShimmer(),
                ),
                16.verticalSpace,
                SizedBox(
                  width: deviceWidth / 2,
                  height: 30.h,
                  child: const AppShimmer(),
                ),
                16.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 16.h,
                  child: const AppShimmer(),
                ),
                const AspectRatio(
                  aspectRatio: 0.6,
                  child: AppShimmer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
