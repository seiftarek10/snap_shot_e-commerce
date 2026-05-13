import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';

class GetUserDataUseCase extends UseCase<UserEntity, void> {
  final CheckoutRepo _checkoutRepo;

  GetUserDataUseCase(this._checkoutRepo);

  @override
  Future<Result<UserEntity>> call(void param) async {
    return await _checkoutRepo.getUserData();
  }
}
