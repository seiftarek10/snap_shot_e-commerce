import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_payment_use_case.dart';

abstract class CheckoutRepo {
  Future<Result<void>> makePayment({required MakePaymentParam makePaymentParam});
}
