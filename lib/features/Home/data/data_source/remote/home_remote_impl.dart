import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/features/home/data/models/product_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final IApiServices _apiServices;
  final IRemoteDataBaseServices _dataBaseServices;

  HomeRemoteDataSourceImpl(this._apiServices, this._dataBaseServices);
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await _apiServices.getAll(path: 'products');
    List<ProductModel> products = [];
    for (var product in response['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }

  @override
  Future<void> addFavProduct({required ProductModel product}) async {
    final result = await _dataBaseServices.addWithId(
      collection: CollectionPath.instance.favProducts,
      id: product.id ?? '',
      data: product.toJson(),
    );

    return result;
  }

  @override
  Future<void> removeFavProduct({required String id}) async {
    await _dataBaseServices.delete(
      collection: CollectionPath.instance.favProducts,
      id: id,
    );
  }

  @override
  Future<List<ProductModel>> getFavProducts() async {
    final result = await _dataBaseServices.getAll(
      collection: CollectionPath.instance.favProducts,
    );
    List<ProductModel> products = result
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
  

}
