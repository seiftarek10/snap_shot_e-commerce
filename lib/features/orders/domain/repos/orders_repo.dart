import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';

abstract class OrdersRepo {
  Stream<Result<List<OrderEntity>>> getUserOrders();
}
