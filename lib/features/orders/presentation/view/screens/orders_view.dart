import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/owner_orders_view.dart';
import 'package:snap_shot/features/orders/presentation/view/screens/user_orders_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key, required this.role});
  //######### Todo Rplace it with hive #######//
  final Role role;
  @override
  Widget build(BuildContext context) {
    switch (role) {
      case Role.user:
        return const UserOrdersView();
      case Role.owner:
        return const OwnerOrdersView();
      case Role.staff:
        return const Scaffold();
      default:
        return const Scaffold();
    }
  }
}
