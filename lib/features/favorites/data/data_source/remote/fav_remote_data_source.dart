import 'package:snap_shot/core/models/product_model.dart';

abstract class FavProductsRemoteDataSource {
  Future<List<ProductModel>> getFavProducts({required String uid});
   Future<void> addFavProduct({
    required ProductModel product,
    required String uid,
  });
  Future<void> removeFavProduct({
    required String uid,
    required String prodcutId,
  });
}
