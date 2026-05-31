import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_payment_use_case.dart';

abstract class CheckoutRepo {
  Future<Result<UserEntity>> getUserData();
  Future<Result<void>> makePayment({required MakePaymentParam makePaymentParam});
  Future<Result<void>> makeOrder({required OrderEntity order});
}
