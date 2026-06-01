import 'package:snap_shot/core/models/product_model.dart';

abstract class FavProductsLocalDataSource {
  String? getUserId();
  Future<void> saveFavProducts({required List<ProductModel> products});
  List<ProductModel> getFavProducts();
  Future<void> removeFavProduct({required String id});
  Future<void> addFavProduct({required ProductModel product});
  Future<void> clearFavIds();
  Future<void> updateFavProduct({
    required String productId,
    required bool isFav,
  });
}
