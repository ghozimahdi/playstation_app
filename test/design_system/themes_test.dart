import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/themes.dart';

void main() {
  group('Light Theme', () {
    testWidgets('light theme color scheme is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );

            return MaterialApp(
              theme: lightTheme,
              home: Scaffold(
                appBar: AppBar(title: const Text('Light Theme Test')),
                body: const Center(child: Text('Hello, World!')),
              ),
            );
          },
        ),
      );

      final ThemeData theme =
          Theme.of(tester.element(find.text('Hello, World!')));

      expect(theme.colorScheme.primary, lightColorSchemes.primary);
      expect(theme.colorScheme.secondary, lightColorSchemes.secondary);
      expect(theme.colorScheme.outline, lightColorSchemes.outline);
      expect(theme.colorScheme.tertiary, lightColorSchemes.tertiary);

      expect(theme.scaffoldBackgroundColor, lightColorSchemes.surface);
      expect(theme.dividerColor, lightColorSchemes.outline);
      expect(theme.iconTheme.color, lightColorSchemes.primary);
      expect(theme.listTileTheme.contentPadding, EdgeInsets.zero);
    });

    testWidgets('light theme text theme is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );

            return MaterialApp(
              theme: lightTheme,
              home: Scaffold(
                appBar: AppBar(title: const Text('Light Theme Test')),
                body: const Center(child: Text('Hello, World!')),
              ),
            );
          },
        ),
      );

      final ThemeData theme =
          Theme.of(tester.element(find.text('Hello, World!')));
      final TextTheme textTheme = theme.textTheme;

      expect(textTheme.titleSmall?.fontSize, 16.sp);
      expect(textTheme.titleSmall?.fontWeight, FontWeight.w400);
      expect(textTheme.bodySmall?.fontSize, 12.sp);
      expect(textTheme.bodySmall?.fontWeight, FontWeight.w400);
    });

    testWidgets('light theme button theme is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );

            return MaterialApp(
              theme: lightTheme,
              home: Scaffold(
                appBar: AppBar(title: const Text('Light Theme Test')),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Elevated Button'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Outlined Button'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Text Button'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );

      final ElevatedButtonThemeData elevatedButtonTheme =
          ElevatedButtonTheme.of(tester.element(find.text('Elevated Button')));
      expect(
        elevatedButtonTheme.style?.backgroundColor?.resolve({}),
        lightColorSchemes.primary,
      );
      expect(
        elevatedButtonTheme.style?.foregroundColor?.resolve({}),
        lightColorSchemes.surface,
      );

      final OutlinedButtonThemeData outlinedButtonTheme =
          OutlinedButtonTheme.of(tester.element(find.text('Outlined Button')));
      expect(
        outlinedButtonTheme.style?.foregroundColor?.resolve({}),
        lightColorSchemes.primary,
      );

      final TextButtonThemeData textButtonTheme =
          TextButtonTheme.of(tester.element(find.text('Text Button')));
      expect(
        textButtonTheme.style?.foregroundColor?.resolve({}),
        lightColorSchemes.primary,
      );
    });
  });
}
