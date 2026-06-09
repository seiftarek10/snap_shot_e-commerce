import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owenr_all_orders/domain/repos/owner_order_management_repo.dart';

class DeleteNotConfirmedOrderUseCase extends FutureUseCase<void, OrderEntity> {
  final OwnerOrderManagementRepo _managementRepo;

  DeleteNotConfirmedOrderUseCase(this._managementRepo);
  @override
  Future<Result<void>> call(OrderEntity param) async {
    return await _managementRepo.deleteNotConfirmedOrder(order: param);
  }
}
