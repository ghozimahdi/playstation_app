import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/dot_indicator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DotIndicator renders correct number of dots',
      (WidgetTester tester) async {
    const length = 5;
    const currentIndex = 2;

    await tester.pumpWidget(
      Builder(
        builder: (context) {
          ScreenUtil.init(
            context,
            designSize: const Size(1080, 1920),
            minTextAdapt: true,
          );

          return const MaterialApp(
            home: Scaffold(
              body: DotIndicator(
                length: length,
                currentIndex: currentIndex,
              ),
            ),
          );
        },
      ),
    );

    // Verify that the correct number of dots are rendered
    expect(find.byType(AnimatedContainer), findsNWidgets(length));
  });

  testWidgets('DotIndicator highlights the correct current index',
      (WidgetTester tester) async {
    const length = 5;
    const currentIndex = 2;

    await tester.pumpWidget(
      Builder(
        builder: (context) {
          ScreenUtil.init(
            context,
            designSize: const Size(1080, 1920),
            minTextAdapt: true,
          );

          return const MaterialApp(
            home: Scaffold(
              body: DotIndicator(
                length: length,
                currentIndex: currentIndex,
              ),
            ),
          );
        },
      ),
    );

    // Verify the current index dot is highlighted
    final animatedContainers = tester
        .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
        .toList();

    for (var i = 0; i < length; i++) {
      final container = animatedContainers[i];
      final BoxDecoration decoration = container.decoration! as BoxDecoration;
      if (i == currentIndex) {
        expect(
          container,
          isA<AnimatedContainer>().having(
            (c) => c.constraints,
            'constraints',
            BoxConstraints.tightFor(width: 18.w, height: 8.h),
          ),
        );
        expect(
          decoration,
          BoxDecoration(
            color: colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
        );
      } else {
        expect(
          container,
          isA<AnimatedContainer>().having(
            (c) => c.constraints,
            'constraints',
            BoxConstraints.tightFor(width: 8.w, height: 8.h),
          ),
        );
        expect(
          decoration,
          BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
        );
      }
    }
  });
}
