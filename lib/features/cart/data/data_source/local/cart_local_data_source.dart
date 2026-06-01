import 'package:snap_shot/core/models/product_model.dart';

abstract class CartLocalDataSource {
  String? getUid();
  List<ProductModel> getLoaclCartProducts();
  Future<void> saveCartProducts(List<ProductModel> products);
  Future<void> clearCartProducts();
  Future<void> removeFromCart({required String id});
  Future<void> addtoCart({required ProductModel product});

  Future<void> updateCartProduct({
    required String productId,
    required bool isInCart,
  });
}
