import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/design_system/color_schemes.dart';

class DotIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const DotIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (i) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 8.h,
            width: i == currentIndex ? 18.w : 8.w,
            decoration: BoxDecoration(
              color: i == currentIndex ? colors.yellow : colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
