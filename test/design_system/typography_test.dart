import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/design_system/typography.dart';
import 'package:ps5_99/generated/fonts.gen.dart';

void main() {
  group('TextTheme', () {
    setUp(() {});

    testWidgets('TextTheme properties are correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );
            return MaterialApp(
              home: Scaffold(
                body: Container(),
              ),
            );
          },
        ),
      );

      expect(textTheme.headlineSmall?.fontSize, 24.sp);
      expect(textTheme.headlineSmall?.fontWeight, FontWeight.w400);
      expect(textTheme.titleLarge?.fontSize, 20.sp);
      expect(textTheme.titleLarge?.fontWeight, FontWeight.w400);
      expect(textTheme.titleMedium?.fontSize, 18.sp);
      expect(textTheme.titleMedium?.fontWeight, FontWeight.w400);
      expect(textTheme.titleSmall?.fontSize, 16.sp);
      expect(textTheme.titleSmall?.fontWeight, FontWeight.w400);
      expect(textTheme.bodyLarge?.fontSize, 14.sp);
      expect(textTheme.bodyLarge?.fontWeight, FontWeight.w400);
      expect(textTheme.bodySmall?.fontSize, 12.sp);
      expect(textTheme.bodySmall?.fontWeight, FontWeight.w400);
      expect(textTheme.labelSmall?.fontSize, 10.sp);
      expect(textTheme.labelSmall?.fontWeight, FontWeight.w400);
    });

    testWidgets('TextTheme font family is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );
            return MaterialApp(
              home: Scaffold(
                body: Container(),
              ),
            );
          },
        ),
      );

      expect(textTheme.headlineSmall?.fontFamily, AppFonts.openSans);
      expect(textTheme.titleLarge?.fontFamily, AppFonts.openSans);
      expect(textTheme.titleMedium?.fontFamily, AppFonts.openSans);
      expect(textTheme.titleSmall?.fontFamily, AppFonts.openSans);
      expect(textTheme.bodyLarge?.fontFamily, AppFonts.openSans);
      expect(textTheme.bodySmall?.fontFamily, AppFonts.openSans);
      expect(textTheme.labelSmall?.fontFamily, AppFonts.openSans);
    });

    testWidgets('TextTheme colors are correct', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );
            return MaterialApp(
              home: Scaffold(
                body: Container(),
              ),
            );
          },
        ),
      );

      expect(textTheme.headlineSmall?.color, colors.primaryText);
      expect(textTheme.titleLarge?.color, colors.primaryText);
      expect(textTheme.titleMedium?.color, colors.primaryText);
      expect(textTheme.titleSmall?.color, colors.primaryText);
      expect(textTheme.bodyLarge?.color, colors.primaryText);
      expect(textTheme.bodySmall?.color, colors.primaryText);
      expect(textTheme.labelSmall?.color, colors.primaryText);
    });
  });
}
