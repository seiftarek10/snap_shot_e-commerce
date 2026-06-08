import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/user_orders/presentation/manager/cubit/get_all_user_orders_cubit.dart';
import 'package:snap_shot/shared/widgets/orders_widgets/all_orders_list.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class AllUserOrdersBuilder extends StatelessWidget {
  const AllUserOrdersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUserOrdersCubit, GetAllUserOrdersState>(
      builder: (context, state) {
        if (state is UserOrdersLoadded) {
          if (state.orders.isEmpty) {
            return const AppEmptyWidget();
          }
          return AllOrdersList(enableLoadingState: false, orders: state.orders);
        } else if (state is FailedToLoadOrders) {
          return AppErrorWidget(
            errMessage: state.errMessage,
            onTap: () async {
              context.read<GetAllUserOrdersCubit>().getUserOrders();
            },
          );
        } else {
          return AllOrdersList(
            enableLoadingState: true,
            orders: OrderEntity.mockLoadingList,
          );
        }
      },
    );
  }
}
