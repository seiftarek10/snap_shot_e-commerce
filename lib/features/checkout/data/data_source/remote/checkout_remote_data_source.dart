import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/data/models/order_model.dart';

abstract class CheckoutRemoteDataSource {
  String? getUserId();
  Future<UserModel?> getUserData();
  Future<void> makePayment({required String amount,required String customerId});
  Future<void> makeOrder({required OrderModel order});
}
