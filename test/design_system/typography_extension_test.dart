import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/design_system/typography_extension.dart';

void main() {
  group('TextTheme Extensions', () {
    const TextTheme textTheme = TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
      labelSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
      titleSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
      titleMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      bodyLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    );

    test('HeadlineTextThemeExt works correctly', () {
      expect(textTheme.headlineSmallSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.headlineSmallBold?.fontWeight, FontWeight.w700);
      expect(textTheme.headlineSmallRegular?.fontWeight, FontWeight.w400);
    });

    test('CaptionTextThemeExt works correctly', () {
      expect(textTheme.captionMedium?.fontWeight, FontWeight.w500);
      expect(textTheme.captionRegular?.fontWeight, FontWeight.w400);
      expect(textTheme.captionSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.captionBold?.fontWeight, FontWeight.w700);
      expect(textTheme.captionUnderline?.fontWeight, FontWeight.w700);
      expect(textTheme.captionUnderline?.decoration, TextDecoration.underline);
      expect(textTheme.captionUnderline?.decorationThickness, 1);
    });

    test('TitleTextThemeExt works correctly', () {
      expect(textTheme.titleSmallMedium?.fontWeight, FontWeight.w500);
      expect(textTheme.titleLargeBold?.fontWeight, FontWeight.w700);
      expect(textTheme.titleSmallSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.titleSmallBold?.fontWeight, FontWeight.w700);
      expect(textTheme.titleMediumSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.titleSmallRegular?.fontWeight, FontWeight.w400);
      expect(textTheme.titleMediumRegular?.fontWeight, FontWeight.w400);
    });

    test('BodyTextThemeExt works correctly', () {
      expect(textTheme.bodyLargeSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.bodyLargeBold?.fontWeight, FontWeight.w700);
      expect(textTheme.bodyLargeMedium?.fontWeight, FontWeight.w500);
      expect(textTheme.bodySmallMedium?.fontWeight, FontWeight.w500);
      expect(textTheme.bodySmallSemiBold?.fontWeight, FontWeight.w600);
      expect(textTheme.bodySmallRegular?.fontWeight, FontWeight.w400);
      expect(
        textTheme.bodySmallUnderline?.decoration,
        TextDecoration.underline,
      );
      expect(textTheme.bodySmallUnderline?.decorationThickness, 1);
      expect(textTheme.bodyLargeRegular?.fontWeight, FontWeight.w400);
    });

    testWidgets('TextThemeExt works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                final TextTheme contextTextTheme = context.textTheme;
                expect(contextTextTheme, isNotNull);
                return Container();
              },
            ),
          ),
        ),
      );
    });
  });
}
