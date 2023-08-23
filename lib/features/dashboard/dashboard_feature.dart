import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/features/dashboard/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashBoardFeature extends Feature {
  final _dashBoardBottomNavKey = GlobalKey<NavigatorState>();
  @override
  List<RouteBase> get routes => [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigatonShell) => const HomeScreen(),
            parentNavigatorKey: _dashBoardBottomNavKey,
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                      path: HomeScreen.path,
                      builder: (context, state) => const HomeScreen())
                ],
              ),
            ])
      ];
}
