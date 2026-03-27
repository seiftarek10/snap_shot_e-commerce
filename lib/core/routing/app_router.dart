import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/Authentication/presentation/view/screens/sing_in_view.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/screens/on_boarding_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SingInView();
        },
      ),
      GoRoute(
        path: Routes.instance.onBoarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: Routes.instance.singIn,
        builder: (context, state) => const SingInView(),
      ),
    ],
  );
}
