import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owenr_all_orders/domain/use_case/confirm_order_use_case.dart';
import 'package:snap_shot/features/owenr_all_orders/domain/use_case/delete_confirmed_order_use_case.dart';
import 'package:snap_shot/features/owenr_all_orders/domain/use_case/delete_not_confirmed_order.dart';

part 'order_management_state.dart';

class OrderManagementCubit extends BaseCubit<OrderManagementState> {
  OrderManagementCubit(
    this._confirmOrderUseCase,
    this._deleteConfirmedOrderUseCase,
    this._deleteNotConfirmedOrderUseCase,
  ) : super(const OrderManagementInitial());

  final ConfirmOrderUseCase _confirmOrderUseCase;
  final DeleteConfirmedOrderUseCase _deleteConfirmedOrderUseCase;
  final DeleteNotConfirmedOrderUseCase _deleteNotConfirmedOrderUseCase;

  Future<void> confirmOrder({required OrderEntity order}) async {
    safeEmit(const OrderManagementConfirmLoading());
    final result = await _confirmOrderUseCase.call(order);
    if (result is Success<void>) {
      safeEmit(const OrderManagementSuccess());
    } else if (result is AppFailure<void>) {
      safeEmit(OrderManagementFailure(result.failure.errMessage));
    }
  }

  Future<void> deleteConfirmedOrder({required OrderEntity order}) async {
    safeEmit(const DeleteConfirmLoading());
    final result = await _deleteConfirmedOrderUseCase.call(order);
    if (result is Success<void>) {
      safeEmit(const DeleteOrderSuccess());
    } else if (result is AppFailure<void>) {
      safeEmit(OrderManagementFailure(result.failure.errMessage));
    }
  }

  Future<void> deleteNotConfirmOrder({required OrderEntity order}) async {
    safeEmit(const DeleteNotConfirmLoading());
    final result = await _deleteNotConfirmedOrderUseCase.call(order);
    if (result is Success<void>) {
      safeEmit(const DeleteOrderSuccess());
    } else if (result is AppFailure<void>) {
      safeEmit(OrderManagementFailure(result.failure.errMessage));
    }
  }
}
