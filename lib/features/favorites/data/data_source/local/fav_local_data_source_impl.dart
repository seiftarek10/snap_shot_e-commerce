import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/favorites/data/data_source/local/fav_local_data_source.dart';

class FavProudctsLocalDataSourceImpl implements FavProductsLocalDataSource {
  const FavProudctsLocalDataSourceImpl(this._products, this._userId);
  final ILocalDataBaseServices<ProductModel> _products;
  final ILocalDataBaseServices<UserModel> _userId;

  @override
  List<ProductModel> getFavProducts() {
    return _products.getAllData();
  }

  @override
  Future<void> saveFavProducts({required List<ProductModel> products}) async {
    await _products.addAllData(data: products);
  }

  @override
  String? getUserId() {
    final userData = _userId.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }
}
