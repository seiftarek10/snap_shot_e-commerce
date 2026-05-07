import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

abstract class HomeLocalDataSource {
  //save
  Future<void> saveProductsData(List<ProductModel> products);
  Future<void> addFavProducts({required List<ProductModel> products});
  Future<void> addToCart({required List<ProductModel> products});

  //get
  List<ProductModel> getProductsData();
  List<ProductModel> getFavProducts();
  List<ProductModel> getCartProducts();
  UserModel? getUserData();

  //clear
  Future<void> clearFavIds();
  Future<void> clearCartProducts();
  Future<void> clearProducsBox();
}
