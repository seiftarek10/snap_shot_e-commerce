import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/order_management/order_management_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.order,
    required this.isConfirmedOrder,
  });

  final OrderEntity order;
  final bool isConfirmedOrder;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderManagementCubit, OrderManagementState>(
      listener: (context, state) {
        if (state is OrderManagementSuccess) {
          AppSnackBar.show(context, message: 'Done');
          context.pop();
        }
        if (state is OrderManagementFailure) {
          AppSnackBar.show(context, message: state.errMessage, isError: true);
        }
        if (state is DeleteOrderSuccess) {
          AppSnackBar.show(context, message: 'Deleted');
          context.pop();
        }
      },
      child: BlocBuilder<OrderManagementCubit, OrderManagementState>(
        builder: (context, state) {
          return Row(
            children: [
              isConfirmedOrder == false
                  ? Expanded(
                      child: AppButton(
                        buttonTitle: 'Confirm',
                        onPressed: () {
                          context.read<OrderManagementCubit>().confirmOrder(
                            order: order,
                          );
                        },
                        isLoading: state is OrderManagementConfirmLoading,
                      ),
                    )
                  : const SizedBox.shrink(),
              isConfirmedOrder == false
                  ? AppSpace.instance.h12
                  : const SizedBox.shrink(),
              Expanded(
                child: AppButton(
                  buttonTitle: 'Delete',
                  onPressed: () {
                    isConfirmedOrder
                        ? context
                              .read<OrderManagementCubit>()
                              .deleteConfirmedOrder(order: order)
                        : context
                              .read<OrderManagementCubit>()
                              .deleteNotConfirmOrder(order: order);
                  },
                  isLoading:
                      state is DeleteNotConfirmLoading ||
                      state is DeleteConfirmLoading,
                  backgroundColor: const Color.fromARGB(255, 120, 16, 9),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
