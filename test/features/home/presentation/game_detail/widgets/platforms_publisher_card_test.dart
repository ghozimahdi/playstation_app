import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/common/app_locale.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/platforms_publisher_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('PlatformsPublisherCard renders correctly',
      (WidgetTester tester) async {
    const platforms = 'PC, PS5, Xbox';
    const publisher = 'Sample Publisher';
    const developer = 'Sample Developer';

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: AppLocale.values.map((e) => e.toLocale).toList(),
        path: 'assets/translations',
        fallbackLocale: AppLocale.indonesian.toLocale,
        child: Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designSize: const Size(1080, 1920),
              minTextAdapt: true,
            );

            return const MaterialApp(
              home: Scaffold(
                body: PlatformsPublisherCard(
                  platforms: platforms,
                  publisher: publisher,
                  developer: developer,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify that the platform, developer, and publisher texts are displayed
    expect(find.text(cw.label_platforms.t), findsOneWidget);
    expect(find.text(cw.label_developer.t), findsOneWidget);
    expect(find.text(cw.label_publisher.t), findsOneWidget);

    // Verify that the correct platforms, developer, and publisher values are displayed
    expect(find.text(platforms), findsOneWidget);
    expect(find.text(publisher), findsOneWidget);
    expect(find.text(developer), findsOneWidget);

    // Verify that the container has the correct color
    final containerFinder = find.byWidgetPredicate(
      (widget) => widget is Container && widget.color == colors.gray70,
    );
    expect(containerFinder, findsOneWidget);
  });
}
