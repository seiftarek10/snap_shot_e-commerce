import 'dart:async';

import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/user_orders/domain/use_cases/get_user_orders_use_case.dart';

part 'get_al_userl_orders_state.dart';

class GetAllUserOrdersCubit extends BaseCubit<GetAllUserOrdersState> {
  GetAllUserOrdersCubit(this._ordersUseCase)
    : super(const GetAllOrdersInitial());

  final GetUserOrdersUseCase _ordersUseCase;

  Future<void> getUserOrders() async {
    safeEmit(const GettingUserOrders());
    final result = await _ordersUseCase.call(null);
    if (result is Success<List<OrderEntity>>) {
      List<OrderEntity> sortedOrders = sortOrdersByDate(result.data);
      safeEmit(UserOrdersLoadded(sortedOrders));
    } else if (result is AppFailure<List<OrderEntity>>) {
      safeEmit(FailedToLoadOrders(result.failure.errMessage));
    }
  }

  List<OrderEntity> sortOrdersByDate(List<OrderEntity> orders) {
    orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    return orders;
  }
}
