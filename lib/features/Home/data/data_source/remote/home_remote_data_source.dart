import 'package:snap_shot/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<void> addFavProduct({required ProductModel product});
  Future<void> removeFavProduct({required String id});
  Future<List<ProductModel>> getFavProducts();
}
