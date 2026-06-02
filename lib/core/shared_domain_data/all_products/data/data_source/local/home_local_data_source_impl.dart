import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/data/data_source/local/home_local_data_source.dart';

class ProductsLocalDataSourceImpl extends ProductsLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _productsBox;

  ProductsLocalDataSourceImpl(this._productsBox);
  @override
  Future<void> saveProductsData(List<ProductModel> products) async {
    await _productsBox.clear();
    for (var product in products) {
      await _productsBox.addDataWithKey(key: product.id!, data: product);
    }
  }

  @override
  List<ProductModel> getProductsData() {
    return _productsBox.getAllData();
  }

  @override
  Future<void> clearProducsBox() async {
    await _productsBox.clear();
  }
}
