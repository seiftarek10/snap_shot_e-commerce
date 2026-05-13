import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/entity/order_entity.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';

class MakeOrderUseCase extends UseCase<void, OrderEntity> {
  final CheckoutRepo _checkoutRepo;

  const MakeOrderUseCase(this._checkoutRepo);
  @override
  Future<Result<void>> call(OrderEntity param) async {
    return await _checkoutRepo.makeOrder(order: param);
  }
}
