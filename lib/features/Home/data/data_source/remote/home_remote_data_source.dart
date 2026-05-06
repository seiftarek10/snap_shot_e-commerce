import 'package:snap_shot/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<void> addFavProduct({required ProductModel product,required String uid});
  Future<void> removeFavProduct({required String uid,required String prodcutId});
  Future<List<ProductModel>> getFavProducts({required String uid});
    Future<void> addToCart({required String uid, required ProductModel product});
  Future<void> removeFromCart({required String uid, required String prodyctid});
  Future<List<ProductModel>> getCartProducts({required String uid});

}
