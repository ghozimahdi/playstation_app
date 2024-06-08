import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/design_system/typography_extension.dart';
import 'package:ps5_99/features/home/presentation/game_list/widgets/item_card.dart';

@RoutePage()
class GameListPage extends StatelessWidget {
  const GameListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 45.dm,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: SearchBar(
                      hintText: cw.hint_search.t,
                      trailing: const [
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Text(
                cw.title_popular_games.t,
                style: context.textTheme.bodyLargeSemiBold,
              ),
              40.verticalSpace,
              const ItemCard(),
              30.verticalSpace,
              const ItemCard(),
            ],
          ),
        ),
      ),
    );
  }
}
