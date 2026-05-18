import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/orders/domain/repos/orders_repo.dart';

class GetUserOrdersUseCase extends UseCase<List<OrderEntity>, void> {
  final OrdersRepo _ordersRepo;

  const GetUserOrdersUseCase(this._ordersRepo);
  @override
  Future<Result<List<OrderEntity>>> call(void param) async {
    return await _ordersRepo.getUserOrders();
  }
}
