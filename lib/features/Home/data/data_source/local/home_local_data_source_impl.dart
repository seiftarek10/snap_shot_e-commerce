import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/core/models/product_model.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _productsBox;
  final ILocalDataBaseServices<UserModel> _userBox;
  

  HomeLocalDataSourceImpl(
    this._productsBox,
    this._userBox,
  
  );
  @override
  Future<void> saveProductsData(List<ProductModel> products) async {
    await _productsBox.clear();
    for (var product in products) {
      await _productsBox.addDataWithKey(key: product.id!, data: product);
    }
  }

  @override
  List<ProductModel> getProductsData() {
    return _productsBox.getAllData();
  }

  @override
  String? getUserId() {
    final userDate = _userBox.getAllData();
    if (userDate.isEmpty) {
      return null;
    }
    return userDate.first.uid;
  }

  @override
  Future<void> clearProducsBox() async {
    await _productsBox.clear();
  }
  

}
