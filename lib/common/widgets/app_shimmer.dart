import 'package:flutter/material.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double radius;

  const AppShimmer({
    super.key,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colors.gray70,
      highlightColor: colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: const ColoredBox(color: colors.black),
      ),
    );
  }
}
