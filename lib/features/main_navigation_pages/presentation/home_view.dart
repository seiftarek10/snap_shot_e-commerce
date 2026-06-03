import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';

import 'package:snap_shot/features/owner_home/presentation/view/screens/owner_home_view.dart';
import 'package:snap_shot/features/user_home/presentation/view/screens/user_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.role});
  // ####### Todo add role to with hive #######//
  final Role role;
  @override
  Widget build(BuildContext context) {
    switch (role) {
      case Role.user:
        return const UserHomeView();
      case Role.owner:
        return const OwnerHomeView();
      case Role.staff:
        return const Scaffold();
      default:
        return const Scaffold();
    }
  }
}
