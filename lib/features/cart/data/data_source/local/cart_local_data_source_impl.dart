import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/cart/data/data_source/local/cart_local_data_source.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _cartProuct;
  final ILocalDataBaseServices<UserModel> _user;

  CartLocalDataSourceImpl(this._cartProuct, this._user);
  @override
  List<ProductModel> getLoaclCartProducts() {
    return _cartProuct.getAllData();
  }

  @override
  Future<void> saveCartProducts(List<ProductModel> products) async {
    await _cartProuct.clear();
    await _cartProuct.addAllData(data: products);
  }

  @override
  String? getUid() {
    final userData = _user.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }
}
