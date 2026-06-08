import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class AllOrdersRepo {
  Stream<Result<List<OrderEntity>>> getAllOrders();
}
