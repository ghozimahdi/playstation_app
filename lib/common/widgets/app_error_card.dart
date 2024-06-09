import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

class AppErrorCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final String message;
  final Widget? image;

  const AppErrorCard({
    super.key,
    this.onPressed,
    required this.message,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.dm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: image ?? const SizedBox.shrink(),
          ),
          16.verticalSpace,
          Text(
            message,
            style: context.textTheme.bodySmallSemiBold?.copyWith(
              color: colors.primaryText,
            ),
            textAlign: TextAlign.center,
          ),
          16.verticalSpace,
          FilledButton(
            onPressed: onPressed,
            child: Text(cw.button_try_again.t),
          ),
        ],
      ),
    );
  }
}
