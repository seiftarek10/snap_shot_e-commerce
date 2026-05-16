import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';

class MakePaymentUseCase extends UseCase<void, String> {
  final CheckoutRepo _checkoutRepo;

  MakePaymentUseCase(this._checkoutRepo);
  @override
  Future<Result<void>> call(String param) async {
    return await _checkoutRepo.makePayment(amount: param);
  }
}
