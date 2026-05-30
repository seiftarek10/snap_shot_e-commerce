import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/data/data_source/local/checkout_local_data_source.dart';

class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final ILocalDataBaseServices<UserModel> _userbox;
  final ILocalDataBaseServices<OrderModel> _orderBox;
  final ILocalDataBaseServices<ProductModel> _cartBox;

  CheckoutLocalDataSourceImpl(this._userbox, this._orderBox, this._cartBox);
  @override
  String? getUserid() {
    return _userbox.getAllData()?.first.uid;
  }

  @override
  UserModel? getUserData() {
    return _userbox.getAllData()?.first;
  }

  @override
  Future<void> clearOrdersBox() async {
    await _orderBox.clear();
  }

  @override
  Future<void> clearCartBox() async {
    await _cartBox.clear();
  }
}
