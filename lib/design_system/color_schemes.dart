import 'package:flutter/material.dart';
import 'package:ps5_99/generated/colors.gen.dart';

const ColorScheme lightColorSchemes = ColorScheme.light(
  primary: colors.primary,
  secondary: colors.secondary,
  outline: colors.gray70,
  tertiary: colors.secondaryText,
);

const ColorScheme darkColorSchemes = ColorScheme.dark(
  primary: colors.primary,
  secondary: colors.secondary,
  outline: colors.gray70,
  tertiary: colors.secondaryText,
);

extension ColorThemeExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

// ignore: camel_case_types
typedef colors = AppColors;
