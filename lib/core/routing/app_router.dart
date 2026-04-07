import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/routing/app_shell/app_shell.dart';
import 'package:snap_shot/features/account/presentation/view/screens/account_details_view.dart';
import 'package:snap_shot/features/account/presentation/view/screens/account_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/forget_password_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_in_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_up_view.dart';
import 'package:snap_shot/features/checkout/presentation/view/screens/checkout_view.dart';
import 'package:snap_shot/features/favorites/presentation/view/screens/favorite_view.dart';
import 'package:snap_shot/features/on_boarding/presentation/view/screens/on_boarding_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/orders_view.dart';
import 'package:snap_shot/features/product_details/presentation/view/screens/product_details.dart';

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
      GoRoute(
        path: Routes.instance.productDetails,
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: Routes.instance.checkout,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: Routes.instance.orders,
        builder: (context, state) => const OrdersView(),
      ),
      GoRoute(
        path: Routes.instance.favorite,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: Routes.instance.account,
        builder: (context, state) => const AccountView(),
      ),
         GoRoute(
        path: Routes.instance.accountDetails,
        builder: (context, state) => const AccountDetailsView(),
      ),
    ],
  );
}
