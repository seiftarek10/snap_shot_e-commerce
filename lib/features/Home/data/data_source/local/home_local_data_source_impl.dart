import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _productsBox;
  final ILocalDataBaseServices<ProductModel> _favIdsBox;
  final ILocalDataBaseServices<ProductModel> _cartBox;
  final ILocalDataBaseServices<UserModel> _userBox;

  HomeLocalDataSourceImpl(
    this._productsBox,
    this._favIdsBox,
    this._cartBox,
    this._userBox,
  );
  @override
  Future<void> saveProductsData(List<ProductModel> products) async {
    await _productsBox.clear();
    await _productsBox.addAllData(data: products);
  }

  @override
  List<ProductModel> getProductsData() {
    return _productsBox.getAllData() ?? [];
  }

  @override
  Future<void> addFavProducts({required List<ProductModel> products}) async {
    await _favIdsBox.addAllData(data: products);
  }

  @override
  Future<void> clearFavIds() async {
    await _favIdsBox.clear();
  }

  @override
  List<ProductModel> getFavProducts() {
    return _favIdsBox.getAllData() ?? [];
  }

  @override
  Future<void> addToCart({required List<ProductModel> products}) async {
    await _cartBox.addAllData(data: products);
  }

  @override
  Future<void> clearCartProducts() async {
    await _cartBox.clear();
  }

  @override
  List<ProductModel> getCartProducts() {
    return _cartBox.getAllData() ?? [];
  }

  @override
  UserModel? getUserData() {
    return _userBox.getAllData()?.first;
  }

  @override
  Future<void> clearProducsBox() async {
    await _productsBox.clear();
  }
}
