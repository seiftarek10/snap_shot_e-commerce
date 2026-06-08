import 'package:snap_shot/core/models/order_model.dart';

abstract class AllOrdersRemoteDataSource {
  Stream<List<OrderModel>> getAllOrders();
}
