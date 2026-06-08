import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/user_orders/domain/repos/orders_repo.dart';

class GetUserDataUseCase extends FutureUseCase<UserEntity, void> {
  final UserOrdersRepo _userOrdersRepo;

  GetUserDataUseCase(this._userOrdersRepo);

  @override
  Future<Result<UserEntity>> call(void param) async {
    return await _userOrdersRepo.getUserData();
  }
}
