import 'package:snap_shot/core/models/order_model.dart';

abstract class OrdersLocalDataSorce {
  Future<void> saveUserOrders({required List<OrderModel> orders});
  List<OrderModel> getUserOrders();
  String? getUid();
}
