import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/screens/on_boarding_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingView();
        },
      ),
    ],
  );
}
