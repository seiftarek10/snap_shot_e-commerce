import 'package:snap_shot/core/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
 
  Future<List<ProductModel>> getFavProducts({required String uid});
  Future<List<ProductModel>> getCartProducts({required String uid});
}
