import 'dart:async';

import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/use_case/get_all_confirmed_orders_use_case.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/use_case/get_all_not_confirmed_orders_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

part 'get_all_app_orders_state.dart';

class GetAllAppOrdersCubit extends BaseCubit<GetAllAppOrdersState> {
  GetAllAppOrdersCubit(
    this._getAllConfirmedOrdersUseCase,
    this._getAllNotConfirmedOrdersUseCase,
  ) : super(const GetAllOrdersInitial());
  final GetAllConfirmedOrdersUseCase _getAllConfirmedOrdersUseCase;
  final GetAllNotConfirmedOrdersUseCase _getAllNotConfirmedOrdersUseCase;

  StreamSubscription? _confirmedSub;
  StreamSubscription? _notConfirmedSub;
  int currentIndex = 0;

  void getOrders({required int index}) {
    if (index == 0) {
      _getAllNotConfirmedAppOrders();
      currentIndex = index;
    } else {
      _getAllConfirmedAppOrders();
      currentIndex = index;
    }
  }

  void _getAllConfirmedAppOrders() {
    safeEmit(const GetAllOrdersLoading());
    _confirmedSub?.cancel();
    _confirmedSub = _getAllConfirmedOrdersUseCase.call(null).listen((reuslt) {
      if (reuslt is Success<List<OrderEntity>>) {
        safeEmit(GetAllOrdersSuccess(reuslt.data));
      }
      if (reuslt is AppFailure<List<OrderEntity>>) {
        safeEmit(GetAllOrdersFailure(reuslt.failure.errMessage));
      }
    });
  }

  void _getAllNotConfirmedAppOrders() {
    safeEmit(const GetAllOrdersLoading());
    _notConfirmedSub?.cancel();
    _notConfirmedSub = _getAllNotConfirmedOrdersUseCase.call(null).listen((
      reuslt,
    ) {
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
    await _confirmedSub?.cancel();
    await _notConfirmedSub?.cancel();
    return super.close();
  }
}
