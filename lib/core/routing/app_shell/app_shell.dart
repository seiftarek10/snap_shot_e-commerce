import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/main_navigation_pages/presentation/home_view.dart';
import 'package:snap_shot/core/routing/app_shell/app_bottom_bar.dart';
import 'package:snap_shot/features/cart/presentation/view/screens/cart_view.dart';
import 'package:snap_shot/features/owner_all_products/presentation/view/screens/owner_all_products_view.dart';
import 'package:snap_shot/features/favorites/presentation/view/screens/favorite_view.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/view/screens/owner_orders_view.dart';
import 'package:snap_shot/features/show_all_users/presentation/manager/get_all_users/get_all_users_cubit.dart';
import 'package:snap_shot/features/show_all_users/presentation/view/screens/all_user_view.dart';
import 'package:snap_shot/features/user_orders/presentation/view/screens/user_orders_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.role, required this.pageIndex});

  final Role role;
  final int pageIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = _buildPages(widget.role);
  }

  List<Widget> _buildPages(Role role) {
    switch (role) {
      case Role.user:
        return const [
          HomeView(role: Role.user),
          UserOrdersView(),
          FavoriteView(),
          CartView(),
        ];
      case Role.owner:
        return [
          const HomeView(role: Role.owner),
          const OwnerAllProductsView(fromHomeScreen: false),
          const OwnerOrdersView(fromHomeScreen: false),
          BlocProvider(
            create: (context) => sl<GetAllUsersCubit>()..getAllUsers(),
            child: const AllUserView(fromHomeScreen: false,),
          ),
        ];
      case Role.staff:
      default:
        return const [Scaffold(), Scaffold(), Scaffold()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        role: widget.role,
        index: widget.pageIndex,
        onTap: (index) {
          context.go(Routes.instance.appShell, extra: index);
        },
      ),
      body: SafeArea(child: _pages[widget.pageIndex]),
    );
  }
}
