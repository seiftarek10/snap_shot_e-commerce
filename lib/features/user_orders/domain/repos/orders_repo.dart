import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';

abstract class UserOrdersRepo {
  Future<Result<List<OrderEntity>>> getUserOrders();
  Future<Result<UserEntity>> getUserData();
  Future<Result<void>> makeOrder({required OrderEntity order});
}
