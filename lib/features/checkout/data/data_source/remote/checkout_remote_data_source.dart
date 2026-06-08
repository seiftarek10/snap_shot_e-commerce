import 'package:snap_shot/core/models/user_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<UserModel?> getUserData();
  Future<void> makePayment({
    required String amount,
    required String customerId,
  });

}
