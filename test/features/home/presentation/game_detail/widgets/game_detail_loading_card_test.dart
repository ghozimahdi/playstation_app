import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/common/widgets/app_shimmer.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/game_detail_loading_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('GameDetailLoadingCard renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              ScreenUtil.init(
                context,
                designSize: const Size(1080, 1920),
                minTextAdapt: true,
              );

              return const GameDetailLoadingCard();
            },
          ),
        ),
      ),
    );

    // Verify that the AppShimmer widgets are rendered
    expect(find.byType(AppShimmer), findsNWidgets(5));

    // Verify the first AppShimmer aspect ratio
    final firstShimmer =
        tester.widget<AspectRatio>(find.byType(AspectRatio).first);
    expect(firstShimmer.aspectRatio, 1.1);

    // Verify the last AppShimmer aspect ratio
    final lastShimmer =
        tester.widget<AspectRatio>(find.byType(AspectRatio).last);
    expect(lastShimmer.aspectRatio, 0.6);
  });
}
