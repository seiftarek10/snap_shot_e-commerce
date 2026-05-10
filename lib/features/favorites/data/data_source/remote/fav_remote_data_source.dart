import 'package:snap_shot/core/models/product_model.dart';

abstract class FavProductsRemoteDataSource {
  Future<List<ProductModel>> getFavProducts({required String uid});
}
