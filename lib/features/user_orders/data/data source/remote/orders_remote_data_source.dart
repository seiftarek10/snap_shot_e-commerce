import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>>getUserOrders();
    Future<void> makeOrder({required OrderModel order});
  Future<void> deleteProductsCart();
    Future<UserModel?> getUserData();


}
