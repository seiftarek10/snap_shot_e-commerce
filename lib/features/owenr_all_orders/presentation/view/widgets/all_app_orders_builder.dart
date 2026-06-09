import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/get_all_app_orders/get_all_app_orders_cubit.dart';
import 'package:snap_shot/shared/widgets/orders_widgets/all_orders_list.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class AllAppOrdersBuilder extends StatelessWidget {
  const AllAppOrdersBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetAllAppOrdersCubit, GetAllAppOrdersState>(
        builder: (context, state) {
            final getOrdersCubit = context.read<GetAllAppOrdersCubit>();
          if (state is GetAllOrdersSuccess) {
            if (state.orders.isEmpty) {
              return const Center(child: AppEmptyWidget());
            }
            return AllOrdersList(
              enableLoadingState: false,
              orders: state.orders,
              role: Role.owner,
              isConfirmedList: getOrdersCubit.currentIndex==1,
            );
          } else if (state is GetAllOrdersFailure) {
            return Center(
              child: AppErrorWidget(
                errMessage: state.errMessage,
                onTap: () {
                  final getOrdersCubit = context.read<GetAllAppOrdersCubit>();
                  getOrdersCubit.getOrders(index: getOrdersCubit.currentIndex);
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.instance.black),
            );
          }
        },
      ),
    );
  }
}
