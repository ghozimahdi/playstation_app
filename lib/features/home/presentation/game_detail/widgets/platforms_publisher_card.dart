import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

class PlatformsPublisherCard extends StatelessWidget {
  final String platforms;
  final String publisher;
  final String developer;

  const PlatformsPublisherCard({
    super.key,
    required this.platforms,
    required this.publisher,
    required this.developer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.gray70,
      padding: EdgeInsets.all(12.dm),
      child: Column(
        children: [
          _buildItem(context, cw.label_platforms.t, platforms),
          4.verticalSpace,
          _buildItem(context, cw.label_developer.t, developer),
          4.verticalSpace,
          _buildItem(context, cw.label_publisher.t, publisher),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLargeBold,
        ),
        Expanded(
          child: Text(
            value,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
