import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/design_system/color_schemes.dart';

void main() {
  group('ColorThemeExt', () {
    testWidgets('light theme color scheme should match the defined colors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light().copyWith(colorScheme: lightColorSchemes),
          home: Builder(
            builder: (context) {
              final colorScheme = context.colorScheme;
              expect(colorScheme.primary, colors.primary);
              expect(colorScheme.secondary, colors.secondary);
              expect(colorScheme.outline, colors.gray70);
              expect(colorScheme.tertiary, colors.secondaryText);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('dark theme color scheme should match the defined colors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark().copyWith(colorScheme: darkColorSchemes),
          home: Builder(
            builder: (context) {
              final colorScheme = context.colorScheme;
              expect(colorScheme.primary, colors.primary);
              expect(colorScheme.secondary, colors.secondary);
              expect(colorScheme.outline, colors.gray70);
              expect(colorScheme.tertiary, colors.secondaryText);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
