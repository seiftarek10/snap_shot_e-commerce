import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

abstract class HomeLocalDataSource {
  Future<void> saveProductsData(List<ProductModel> products);
  List<ProductModel> getProductsData();
  Future<void> addFavProducts({required List<ProductModel> products});
  List<ProductModel> getFavProducts();
  Future<void> clearFavIds();
  Future<void> addToCart({required List<ProductModel> products});
  List<ProductModel> getCartProducts();
  Future<void> clearCartProducts();
  UserModel? getUserData();
}
