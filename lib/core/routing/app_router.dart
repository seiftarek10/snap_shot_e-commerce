import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/routing/app_shell/app_shell.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/account/presentation/view/screens/my_account_view.dart';
import 'package:snap_shot/features/authentication/presentation/model/otp_args_model.dart';
import 'package:snap_shot/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/forget_password_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/otp_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_in_view.dart';
import 'package:snap_shot/features/authentication/presentation/view/screens/sign_up_view.dart';
import 'package:snap_shot/features/cart/presentation/view/screens/cart_view.dart';
import 'package:snap_shot/features/category/presentation/view/screens/category_products_view.dart';
import 'package:snap_shot/features/checkout/presentation/view/screens/checkout_view.dart';
import 'package:snap_shot/features/favorites/presentation/view/screens/favorite_view.dart';
import 'package:snap_shot/features/initial_screen_manager/presentation/init_screen.dart';
import 'package:snap_shot/features/on_boarding/presentation/view/screens/on_boarding_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/order_details_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/orders_view.dart';
import 'package:snap_shot/features/product_details/presentation/model/product_details_extra_model.dart';
import 'package:snap_shot/features/product_details/presentation/view/screens/product_details_view.dart';

enum Role { user, owner, delivery, staff }

class AppRouter {
  AppRouter({required this.role});
  final Role role;
  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return InitScreen(role: role);
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
        builder: (context, state) {
          int? pageIndex = state.extra as int?;
          return AppShell(role: role, pageIndex: pageIndex ?? 0);
        },
      ),
      GoRoute(
        path: Routes.instance.productDetails,
        builder: (context, state) {
          final extra = state.extra as ProductDetailsExtraModel;
          final view = ProductDetailsView(
            role: role,
            productEntity: extra.productEntity,
            fromHomeScreen: extra.fromHomeScreen,
          );
          if (role != Role.user) {
            return ProductDetailsView(
              role: role,
              productEntity: extra.productEntity,
              fromHomeScreen: extra.fromHomeScreen,
            );
          }
          return extra.fromHomeScreen
              ? MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: extra.getAllProductsCubit!),
                    BlocProvider.value(value: extra.userHomeCartCubit!),
                  ],
                  child: view,
                )
              : BlocProvider(
                  create: (context) => sl<UserCartManegerCubit>(),
                  child: view,
                );
        },
      ),

      GoRoute(
        path: Routes.instance.checkout,
        builder: (context, state) {
          final products = state.extra as List<ProductEntity>;
          return CheckoutView(products: products);
        },
      ),
      GoRoute(
        path: Routes.instance.orders,
        builder: (context, state) => OrdersView(role: role),
      ),
      GoRoute(
        path: Routes.instance.favorite,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: Routes.instance.account,
        builder: (context, state) => const MyAccountView(),
      ),
    
      GoRoute(
        path: Routes.instance.ownerCategoryProducts,
        builder: (context, state) => const OwnerCategoryProductsView(),
      ),
      GoRoute(
        path: Routes.instance.orderDetails,
        builder: (context, state) {
          final orderExtra = state.extra as OrderEntity;
          return OrderDetailsView(order: orderExtra);
        },
      ),
      GoRoute(
        path: Routes.instance.cartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: Routes.instance.otpView,
        builder: (context, state) {
          final data = state.extra as OtpArgsModel;

          return BlocProvider.value(
            value: context.read<SignUpCubit>(),
            child: OtpView(otpArgs: data),
          );
        },
      ),
    ],
  );
}
