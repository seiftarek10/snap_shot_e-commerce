import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/repos/all_orders_repo.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

class GetAllNotConfirmedOrdersUseCase extends StreamUseCase<List<OrderEntity>, void> {
  final AllOrdersRepo _ordersRepo;

  GetAllNotConfirmedOrdersUseCase(this._ordersRepo);

  @override
  Stream<Result<List<OrderEntity>>> call(void param) {
    return _ordersRepo.getAllNotConfirmedOrders();
  }
}
