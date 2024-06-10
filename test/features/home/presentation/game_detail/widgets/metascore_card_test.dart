import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_99/common/app_locale.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/features/home/presentation/game_detail/widgets/metascore_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('MetaScoreCard renders correctly', (WidgetTester tester) async {
    const reviewsCount = 100;
    const metaCriticScore = 85;
    const metaCriticColor = Colors.red;

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
                body: MetaScoreCard(
                  reviewsCount: reviewsCount,
                  metaCriticScore: metaCriticScore,
                  metaCriticColor: metaCriticColor,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify that the meta score text is displayed
    expect(find.text('$metaCriticScore'), findsOneWidget);
    expect(find.text(cw.label_meta_score.t), findsOneWidget);
    expect(
      find.text(cw.text_base_on_critic.tr(args: ['$reviewsCount'])),
      findsOneWidget,
    );

    // Verify that the container has the correct color
    final containerFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration! as BoxDecoration).color == metaCriticColor,
    );
    expect(containerFinder, findsNWidgets(2));

    final containers = tester.widgetList<Container>(containerFinder).toList();

    // Verify the main Container
    final mainContainer = containers[0];
    final mainContainerDecoration = mainContainer.decoration! as BoxDecoration;
    expect(mainContainerDecoration.color, metaCriticColor);

    // Verify the bottom Container
    final bottomContainer = containers[1];
    final bottomContainerDecoration =
        bottomContainer.decoration! as BoxDecoration;
    expect(bottomContainerDecoration.color, metaCriticColor);
    expect(
      bottomContainerDecoration.borderRadius,
      const BorderRadius.all(Radius.circular(8.0)),
    );

    // Verify the bottom container has the correct height
    final bottomContainerSize = tester.getSize(find.byWidget(bottomContainer));
    expect(bottomContainerSize.height, 4.h);
  });
}
