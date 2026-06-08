import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/get_all_app_orders/get_all_app_orders_cubit.dart';
import 'package:snap_shot/shared/widgets/orders_widgets/all_orders_list.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/user_orders/presentation/view/widgets/current_history_orders.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class OwnerOrdersView extends StatelessWidget {
  const OwnerOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllAppOrdersCubit>()..getAllAppOrders(),
      child: PagePadding(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            const AppPageTitle(pageTitle: 'Orders', arrowBack: false),
            AppSpace.instance.v12,
            const OrderStatusIndicator(labels: ['Current', 'History']),
            AppSpace.instance.v12,
            Expanded(
              child: BlocBuilder<GetAllAppOrdersCubit, GetAllAppOrdersState>(
                builder: (context, state) {
                  if (state is GetAllOrdersSuccess) {
                    if (state.orders.isEmpty) {
                      return const Center(child: AppEmptyWidget());
                    }
                    return AllOrdersList(
                      enableLoadingState: false,
                      orders: state.orders,
                    );
                  } else if (state is GetAllOrdersFailure) {
                    return Center(
                      child: AppErrorWidget(
                        errMessage: state.errMessage,
                        onTap: () {
                          context
                              .read<GetAllAppOrdersCubit>()
                              .getAllAppOrders();
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.instance.black,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
