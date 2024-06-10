import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ps5_99/features/home/presentation/game_list/widgets/app_paged_grid_view.dart';

void main() {
  testWidgets('AppPagedGridView displays items correctly',
      (WidgetTester tester) async {
    final pagingController = PagingController<int, String>(
      firstPageKey: 0,
    );

    pagingController.appendPage(['Item 1', 'Item 2'], 1);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPagedGridView<int, String>(
            pagingController: pagingController,
            itemBuilder: (context, item, index) => Text(item),
            pageRequest: (pageKey) {},
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
  });

  testWidgets('AppPagedGridView displays first page progress indicator',
      (WidgetTester tester) async {
    final pagingController = PagingController<int, String>(
      firstPageKey: 0,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPagedGridView<int, String>(
            pagingController: pagingController,
            itemBuilder: (context, item, index) => Text(item),
            pageRequest: (pageKey) {},
            firstPageProgressIndicatorBuilder: (context) =>
                const CircularProgressIndicator(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
