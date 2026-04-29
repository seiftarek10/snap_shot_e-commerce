import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/features/home/presentation/view%20model/cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/screens/owner_home_view.dart';

import 'package:snap_shot/features/home/presentation/view/screens/user_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.role});
  // ####### Todo add role to with hive #######//
  final Role role;
  @override
  Widget build(BuildContext context) {
    switch (role) {
      case Role.user:
        return BlocProvider(
          create: (context) =>
              getIt.get<GetAllProductsCubit>()..getAllProducts(),
          child: const UserHomeView(),
        );
      case Role.owner:
        return const OwnerHomeView();
      case Role.staff:
        return const Scaffold();
      default:
        return const Scaffold();
    }
  }
}
