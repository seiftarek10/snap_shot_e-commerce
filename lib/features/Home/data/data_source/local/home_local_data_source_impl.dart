import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final ILocalDataBaseServices<ProductEntity> _iLocalDataBaseServices;

  HomeLocalDataSourceImpl(this._iLocalDataBaseServices);
  @override
  Future<void> saveProductsData(List<ProductEntity> products) async {
    await _iLocalDataBaseServices.clear();
    await _iLocalDataBaseServices.addAllData(data: products);
  }

  @override
  List<ProductEntity> getProductsData() {
    return _iLocalDataBaseServices.getAllData() ?? [];
  }
}
