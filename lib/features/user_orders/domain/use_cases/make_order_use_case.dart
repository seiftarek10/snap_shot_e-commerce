import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/user_orders/domain/repos/orders_repo.dart';

class MakeOrderUseCase extends FutureUseCase<void, OrderEntity> {
  final UserOrdersRepo _userOrdersRepo;


  const MakeOrderUseCase(this._userOrdersRepo);
  @override
  Future<Result<void>> call(OrderEntity param) async {
    return await _userOrdersRepo.makeOrder(order: param);
  }
}
