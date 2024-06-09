import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ps5_99/common/widgets/app_circular_progress_indicator.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/generated/assets.gen.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) => const Center(
        child: AppCircularProgressIndicator(),
      ),
      errorWidget: (_, __, ___) => Container(
        width: double.infinity,
        color: colors.white,
        child: Image.asset(AppAssets.images.img404.path),
      ),
    );
  }
}
