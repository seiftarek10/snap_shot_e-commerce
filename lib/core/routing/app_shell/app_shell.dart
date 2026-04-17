import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/features/Home/presentation/view/screens/home_view.dart';
import 'package:snap_shot/core/routing/app_shell/app_bottom_bar.dart';
import 'package:snap_shot/features/account/presentation/view/screens/my_account_view.dart';
import 'package:snap_shot/features/cart/presentation/view/screens/cart_view.dart';
import 'package:snap_shot/features/favorites/presentation/view/screens/favorite_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/orders_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.role});
  final Role role;
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int currentIndex;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _pages = _buildPages(widget.role);
  }

  List<Widget> _buildPages(Role role) {
    switch (role) {
      case Role.user:
        return const [
          HomeView(),
          OrdersView(),
          FavoriteView(),
          CartView(),
          MyAccountView(),
        ];
      case Role.owner:
        return const [HomeView(), HomeView(), HomeView()];
      case Role.staff:
        return const [HomeView(), HomeView(), HomeView()];
      default:
        return const [HomeView(), HomeView(), HomeView()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        role: widget.role,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: _pages),
      ),
    );
  }
}
