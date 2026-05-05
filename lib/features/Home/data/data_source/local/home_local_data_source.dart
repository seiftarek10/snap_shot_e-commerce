import 'package:snap_shot/features/home/data/models/product_model.dart';

abstract class HomeLocalDataSource {
  Future<void> saveProductsData(List<ProductModel> products);
  List<ProductModel> getProductsData();
  Future<void> addFavProducts({required List<ProductModel> products});
  Future<void> clear();
}
