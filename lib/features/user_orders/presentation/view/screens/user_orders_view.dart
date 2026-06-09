import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/user_orders/presentation/manager/cubit/get_all_user_orders_cubit.dart';
import 'package:snap_shot/features/user_orders/presentation/view/widgets/all_user_orders_builder.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllUserOrdersCubit>()..getUserOrders(),
      child: PagePadding(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            const AppPageTitle(pageTitle: 'Orders', arrowBack: false),
            AppSpace.instance.v12,
            const Expanded(child: AllUserOrdersBuilder()),
          ],
        ),
      ),
    );
  }
}
