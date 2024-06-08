import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/generated/fonts.gen.dart';

import 'color_schemes.dart';

final textTheme = TextTheme(
  headlineSmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
  ),
  titleLarge: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  ),
  bodyLarge: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  ),
  bodySmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  ),
  labelSmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  ),
).apply(
  fontFamily: AppFonts.openSans,
  bodyColor: colors.primaryText,
  displayColor: colors.primaryText,
);
