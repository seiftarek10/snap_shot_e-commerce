import 'package:snap_shot/core/models/product_model.dart';

abstract class ProductsLocalDataSource {
  //save
  Future<void> saveProductsData(List<ProductModel> products);
  //get
  List<ProductModel> getProductsData();

  //clear
  Future<void> clearProducsBox();
}
