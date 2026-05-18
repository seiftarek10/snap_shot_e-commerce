import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/orders/presentation/manager/cubit/get_all_orders_cubit.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/all_orders_list.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class AllUserOrdersBuilder extends StatelessWidget {
  const AllUserOrdersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
      builder: (context, state) {
        if (state is UserOrdersLoadded) {
          return AllOrdersList(enableLoadingState: false, orders: state.orders);
        } else if (state is FailedToLoadOrders) {
          return AppErrorWidget(
            errMessage: state.errMessage,
            onTap: () async {
              context.read<GetAllOrdersCubit>().getUserOrders();
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
