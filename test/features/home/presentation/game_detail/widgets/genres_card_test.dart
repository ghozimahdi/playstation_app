import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/common/app_locale.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/color_schemes.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/genres_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('GenresCard renders correctly', (WidgetTester tester) async {
    const genres = ['Action', 'Adventure', 'RPG'];

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
                body: GenresCard(
                  genres: genres,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify that the genres label text is displayed
    expect(find.text(cw.label_genres.t), findsOneWidget);

    // Verify that the correct number of genres are displayed
    for (final genre in genres) {
      expect(find.text(genre), findsOneWidget);
    }

    // Verify that the container has the correct color
    final containerFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration! as BoxDecoration).color == colors.gray410,
    );
    expect(containerFinder, findsNWidgets(genres.length));
  });
}
