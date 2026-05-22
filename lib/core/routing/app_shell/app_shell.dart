import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/features/Home/presentation/view/screens/home_view.dart';
import 'package:snap_shot/core/routing/app_shell/app_bottom_bar.dart';
import 'package:snap_shot/features/account/presentation/view/screens/my_account_view.dart';
import 'package:snap_shot/features/cart/presentation/view/screens/cart_view.dart';
import 'package:snap_shot/features/category/presentation/view/screens/owner_category_view.dart';
import 'package:snap_shot/features/favorites/presentation/view/screens/favorite_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/orders_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.role, required this.pageIndex});

  final Role role;
  final int pageIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int currentIndex;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.pageIndex;
    _pages = _buildPages(widget.role);
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
   
    if (oldWidget.pageIndex != widget.pageIndex) {
      setState(() {
        currentIndex = widget.pageIndex;
      });
    }
  }

  List<Widget> _buildPages(Role role) {
    switch (role) {
      case Role.user:
        return const [
          HomeView(role: Role.user),
          OrdersView(role: Role.user),
          FavoriteView(),
          CartView(),
          MyAccountView(),
        ];
      case Role.owner:
        return const [
          HomeView(role: Role.owner),
          OwnerCategoryView(),
          OrdersView(role: Role.owner),
        ];
      case Role.staff:
        return const [Scaffold(), Scaffold(), Scaffold()];
      default:
        return const [Scaffold(), Scaffold(), Scaffold()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        role: widget.role,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(child: _pages[currentIndex]),
    );
  }
}
