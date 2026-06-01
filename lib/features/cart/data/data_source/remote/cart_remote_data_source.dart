import 'package:snap_shot/core/models/product_model.dart';

abstract class CartRemoteDataSource {
  Future<List<ProductModel>> getCartProducts({required String uid});
    Future<void> addToCart({required String uid, required ProductModel product});
  Future<void> removeFromCart({required String uid, required String prodyctid});
}
