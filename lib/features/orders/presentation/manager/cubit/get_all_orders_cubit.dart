import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/orders/domain/use_cases/get_user_orders_use_case.dart';

part 'get_all_orders_state.dart';

class GetAllOrdersCubit extends BaseCubit<GetAllOrdersState> {
  GetAllOrdersCubit(this._ordersUseCase) : super(const GetAllOrdersInitial());

  final GetUserOrdersUseCase _ordersUseCase;

  Future<void> getUserOrders() async {
    safeEmit(const GettingUserOrders());
    final result = await _ordersUseCase.call(null);
    if (result is Success<List<OrderEntity>>) {
      safeEmit(UserOrdersLoadded(result.data));
    } else if (result is AppFailure<List<OrderEntity>>) {
      safeEmit(FailedToLoadOrders(result.failure.errMessage));
    }
  }
}
