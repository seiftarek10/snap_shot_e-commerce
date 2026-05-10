import 'package:snap_shot/core/models/product_model.dart';

abstract class FavProductsLocalDataSource {
  String? getUserId();
  Future<void> saveFavProducts({required List<ProductModel> products});
  List<ProductModel> getFavProducts();
}
