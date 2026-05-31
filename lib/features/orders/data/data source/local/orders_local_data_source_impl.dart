import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/orders/data/data%20source/local/orders_local_data_sorce.dart';

class OrdersLocalDataSourceImpl implements OrdersLocalDataSorce {
  final ILocalDataBaseServices<OrderModel> _ordersBox;
  final ILocalDataBaseServices<UserModel> _userBox;

  OrdersLocalDataSourceImpl(this._ordersBox, this._userBox);
  @override
  Future<void> saveUserOrders({required List<OrderModel> orders}) async {
    await _ordersBox.addAllData(data: orders);
  }

  @override
  List<OrderModel> getUserOrders() {
    return _ordersBox.getAllData() ;
  }

  @override
  String? getUid() {
    final userData = _userBox.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }
}
