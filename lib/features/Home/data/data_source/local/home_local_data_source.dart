import 'package:snap_shot/core/models/product_model.dart';

abstract class HomeLocalDataSource {
  //save
  Future<void> saveProductsData(List<ProductModel> products);
  Future<void> addFavProducts({required List<ProductModel> products});
  Future<void> addToCart({required List<ProductModel> products});

  //get
  List<ProductModel> getProductsData();
  List<ProductModel> getFavProducts();
  List<ProductModel> getCartProducts();
  String? getUserId();

  //clear
  Future<void> clearFavIds();
  Future<void> clearCartProducts();
  Future<void> clearProducsBox();
}
