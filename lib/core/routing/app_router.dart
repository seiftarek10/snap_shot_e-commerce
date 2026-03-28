import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/shared/widgets/app_shell.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/forget_password_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_in_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_up_view.dart';
import 'package:snap_shot/features/on_boarding/presentation/view/screens/on_boarding_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AppShell();
        },
      ),
      GoRoute(
        path: Routes.instance.onBoarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: Routes.instance.signIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.instance.signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.instance.forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.instance.appShell,
        builder: (context, state) => const AppShell(),
      ),
    ],
  );
}
