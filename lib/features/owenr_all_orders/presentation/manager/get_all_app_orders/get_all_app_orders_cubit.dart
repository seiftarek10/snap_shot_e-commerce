import 'dart:async';

import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/use_case/get_all_orders_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

part 'get_all_app_orders_state.dart';

class GetAllAppOrdersCubit extends BaseCubit<GetAllAppOrdersState> {
  GetAllAppOrdersCubit(this._getAllOrdersUseCase)
    : super(const GetAllOrdersInitial());
  final GetAllOrdersUseCase _getAllOrdersUseCase;

  StreamSubscription? _subscription;
  void getAllAppOrders() {
    safeEmit(const GetAllOrdersLoading());
    _subscription?.cancel();
    _subscription = _getAllOrdersUseCase.call(null).listen((reuslt) {
      if (reuslt is Success<List<OrderEntity>>) {
        safeEmit(GetAllOrdersSuccess(reuslt.data));
      }
      if (reuslt is AppFailure<List<OrderEntity>>) {
        safeEmit(GetAllOrdersFailure(reuslt.failure.errMessage));
      }
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
