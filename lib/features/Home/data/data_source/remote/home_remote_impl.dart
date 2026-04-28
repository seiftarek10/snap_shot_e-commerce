import 'package:snap_shot/core/data_source/remote_data_source/data_base_services_interfase.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final IRemoteDataBaseServices _dataBaseServices;

  HomeRemoteDataSourceImpl(this._dataBaseServices);
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await _dataBaseServices.getAll(path: 'products');
    List<ProductModel> products = [];
    for (var product in response['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
