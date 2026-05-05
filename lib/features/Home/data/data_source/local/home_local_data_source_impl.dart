import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _iLocalDataBaseServices;

  HomeLocalDataSourceImpl(this._iLocalDataBaseServices);
  @override
  Future<void> saveProductsData(List<ProductModel> products) async {
    await _iLocalDataBaseServices.clear();
    await _iLocalDataBaseServices.addAllData(data: products);
  }

  @override
  List<ProductModel> getProductsData() {
    return _iLocalDataBaseServices.getAllData() ?? [];
  }

  @override
  Future<void> addFavProducts({required List<ProductModel> products}) async {
    await _iLocalDataBaseServices.addDataWithKey(
      key: 'favProd',
      data: products,
    );
  }

  @override
  Future<void> clear() async {
    await _iLocalDataBaseServices.clear();
  }
}
