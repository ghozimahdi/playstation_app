import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: lightColorSchemes,
  textTheme: textTheme,
  scaffoldBackgroundColor: lightColorSchemes.surface,
  dividerColor: lightColorSchemes.outline,
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.zero,
  ),
  iconTheme: IconThemeData(
    color: lightColorSchemes.primary,
  ),
  dividerTheme: DividerThemeData(
    thickness: 1,
    color: lightColorSchemes.outline,
    space: 1,
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(
      color: lightColorSchemes.primary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    scrolledUnderElevation: 0,
  ),
  badgeTheme: BadgeThemeData(
    backgroundColor: lightColorSchemes.tertiary,
    textColor: lightColorSchemes.surface,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorSchemes.surface,
    elevation: 4.dm,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: lightColorSchemes.primary,
    unselectedItemColor: lightColorSchemes.tertiary,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: textTheme.captionMedium?.copyWith(
      color: lightColorSchemes.primary,
    ),
    unselectedLabelStyle: textTheme.captionRegular?.copyWith(
      color: lightColorSchemes.tertiary,
    ),
  ),
  tabBarTheme: TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: lightColorSchemes.tertiary,
    unselectedLabelStyle: textTheme.bodySmallRegular,
    labelColor: lightColorSchemes.primary,
    labelStyle: textTheme.bodySmallMedium,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledBackgroundColor: colors.disabled,
      disabledForegroundColor: lightColorSchemes.tertiary,
      foregroundColor: lightColorSchemes.surface,
      backgroundColor: lightColorSchemes.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      textStyle: textTheme.bodyLargeMedium,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),
    prefixStyle: textTheme.bodyLargeRegular?.copyWith(
      color: lightColorSchemes.secondary,
    ),
    labelStyle: textTheme.bodyLargeRegular?.copyWith(
      color: lightColorSchemes.tertiary,
    ),
    hintStyle: textTheme.bodyLargeRegular?.copyWith(
      color: lightColorSchemes.tertiary,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: lightColorSchemes.secondary.withOpacity(0.2),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.h,
      ),
      textStyle: textTheme.bodyLargeMedium,
      backgroundColor: lightColorSchemes.surface,
      foregroundColor: lightColorSchemes.primary,
      disabledBackgroundColor: colors.disabled,
      disabledForegroundColor: lightColorSchemes.tertiary,
    ).copyWith(
      side: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return const BorderSide(color: colors.disabled);
          }
          return BorderSide(color: lightColorSchemes.primary);
        },
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: lightColorSchemes.primary,
      textStyle: textTheme.bodyLargeMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.h,
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: lightColorSchemes.surface,
    backgroundColor: lightColorSchemes.primary,
    extendedSizeConstraints: BoxConstraints(
      minHeight: 44.h,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.r),
    ),
  ),
  searchBarTheme: SearchBarThemeData(
    padding: WidgetStateProperty.all(EdgeInsets.only(left: 8.w, right: 16.w)),
    shadowColor: WidgetStateProperty.all(colors.gray70.withOpacity(0.5)),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: lightColorSchemes.primary,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: colors.disabled,
      disabledForegroundColor: lightColorSchemes.tertiary,
      foregroundColor: lightColorSchemes.surface,
      backgroundColor: lightColorSchemes.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      textStyle: textTheme.bodyLargeMedium,
    ),
  ),
);
