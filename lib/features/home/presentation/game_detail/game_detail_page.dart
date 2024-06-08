import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GameDetailPage extends StatelessWidget {
  final String id;

  const GameDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
