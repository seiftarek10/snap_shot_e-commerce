import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/domain/entity/order_entity.dart';

abstract class CheckoutRepo {
  Future<Result<UserEntity>> getUserData();
  Future<Result<void>> makePayment({required String amount});
  Future<Result<void>> makeOrder({required OrderEntity order});
}
