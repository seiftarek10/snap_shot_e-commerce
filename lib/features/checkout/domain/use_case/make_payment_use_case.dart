import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';

class MakePaymentUseCase extends FutureUseCase<void, MakePaymentParam> {
  final CheckoutRepo _checkoutRepo;

  MakePaymentUseCase(this._checkoutRepo);
  @override
  Future<Result<void>> call(MakePaymentParam param) async {
    return await _checkoutRepo.makePayment(makePaymentParam: param);
  }
}

class MakePaymentParam {
  final String amount;
  final String customerId;

  MakePaymentParam({required this.amount, required this.customerId});
}
