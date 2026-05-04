import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

abstract class HomeLocalDataSource {
  Future<void> saveProductsData(List<ProductEntity> products);
  List<ProductEntity> getProductsData();
}
