import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/get_all_app_orders/get_all_app_orders_cubit.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/view/widgets/all_app_orders_builder.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/user_orders/presentation/view/widgets/current_history_orders.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OwnerOrdersView extends StatelessWidget {
  const OwnerOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllAppOrdersCubit>()..getOrders(index: 0),
      child: PagePadding(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            const AppPageTitle(pageTitle: 'Orders', arrowBack: false),
            AppSpace.instance.v12,
            const OrderStatusIndicator(labels: ['Current', 'History']),
            AppSpace.instance.v12,
       const AllAppOrdersBuilder()
          ],
        ),
      ),
    );
  }
}
