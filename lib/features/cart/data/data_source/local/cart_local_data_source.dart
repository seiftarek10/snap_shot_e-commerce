import 'package:snap_shot/core/models/product_model.dart';

abstract class CartLocalDataSource {
  String? getUid();
  List<ProductModel> getLoaclCartProducts();
  Future<void> saveCartProducts(List<ProductModel> products);
}
