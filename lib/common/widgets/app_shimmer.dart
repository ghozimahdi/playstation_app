import 'package:flutter/material.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colors.gray70,
      highlightColor: colors.white,
      child: child,
    );
  }
}
