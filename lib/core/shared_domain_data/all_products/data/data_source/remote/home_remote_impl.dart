import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/data/data_source/remote/home_remote_data_source.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final IApiServices _apiServices;

  ProductsRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await _apiServices.getAll(path: 'products');
    List<ProductModel> products = [];
    for (var product in response['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
