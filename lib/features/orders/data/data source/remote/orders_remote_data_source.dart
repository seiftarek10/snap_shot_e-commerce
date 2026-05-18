import 'package:snap_shot/core/models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getUserOrders();
}
