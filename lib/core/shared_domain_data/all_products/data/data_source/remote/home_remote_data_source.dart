import 'package:snap_shot/core/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}
