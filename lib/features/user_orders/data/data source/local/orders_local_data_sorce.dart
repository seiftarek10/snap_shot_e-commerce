import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';

abstract class OrdersLocalDataSorce {
  Future<void> saveUserOrders({required List<OrderModel> orders});
  List<OrderModel> getUserOrders();
  String? getUid();
  UserModel? getUserData();
  Future<void> clearOrdersBox();
  Future<void> clearCartBox();
  Future<void> deleteOrder({required String id});
  Future<void> updateOrder({required OrderModel order});
  Future<OrderModel?> getOrderById({required String id});
  Future<void> deleteOroderProductsFromCart({required List<String> ids});
}
