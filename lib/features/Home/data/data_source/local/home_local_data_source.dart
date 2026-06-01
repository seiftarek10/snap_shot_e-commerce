import 'package:snap_shot/core/models/product_model.dart';

abstract class HomeLocalDataSource {
  //save
  Future<void> saveProductsData(List<ProductModel> products);
  List<ProductModel> getProductsData();
  String? getUserId();

  //clear
  Future<void> clearProducsBox();
}
