import 'package:flutter/material.dart';
import 'package:ps5_99/design_system/color_schemes.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 6,
      color: colors.secondary,
      backgroundColor: colors.secondary.withOpacity(0.2),
    );
  }
}
