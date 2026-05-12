import 'package:snap_shot/core/models/product_model.dart';

abstract class CartRemoteDataSource {
  Future<List<ProductModel>> getCartProducts({required String uid});
}
