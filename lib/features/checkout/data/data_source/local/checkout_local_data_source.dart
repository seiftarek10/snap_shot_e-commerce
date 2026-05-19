import 'package:snap_shot/core/models/user_model.dart';

abstract class CheckoutLocalDataSource {
  String? getUserid();
  UserModel? getUserData();
  Future<void> clearOrdersBox();
}
