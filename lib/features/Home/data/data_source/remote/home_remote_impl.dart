import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:snap_shot/core/models/product_model.dart';

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
  Future<void> addFavProduct({
    required String uid,
    required ProductModel product,
  }) async {
    final result = await _dataBaseServices.addToSubCollectionWithId(
      collection: CollectionPath.instance.allFavProducts,
      parentId: uid,
      subCollection: CollectionPath.instance.userFavProducts,
      childId: product.id ?? '',
      data: product.toJson(),
    );

    return result;
  }

  @override
  Future<void> removeFavProduct({
    required String prodcutId,
    required String uid,
  }) async {
    await _dataBaseServices.deleteFromSubCollection(
      collection: CollectionPath.instance.allFavProducts,
      parentId: uid,
      subCollection: CollectionPath.instance.userFavProducts,
      childId: prodcutId,
    );
  }

  @override
  Future<List<ProductModel>> getFavProducts({required String uid}) async {
    final data = await _dataBaseServices.getSubCollection(
      collection: CollectionPath.instance.allFavProducts,
      parentId: uid,
      subCollection: CollectionPath.instance.userFavProducts,
    );
    List<ProductModel> products = data
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }

  @override
  Future<void> addToCart({
    required ProductModel product,
    required String uid,
  }) async {
    await _dataBaseServices.addToSubCollectionWithId(
      collection: CollectionPath.instance.allCart,
      parentId: uid,
      subCollection: CollectionPath.instance.userCart,
      childId: product.id ?? '0',
      data: product.toJson(),
    );
  }

  @override
  Future<void> removeFromCart({
    required String prodyctid,
    required String uid,
  }) async {
    await _dataBaseServices.deleteFromSubCollection(
      collection: CollectionPath.instance.allCart,
      parentId: uid,
      subCollection: CollectionPath.instance.userCart,
      childId: prodyctid,
    );
  }

  @override
  Future<List<ProductModel>> getCartProducts({required String uid}) async {
    final data = await _dataBaseServices.getSubCollection(
      collection: CollectionPath.instance.allCart,
      parentId: uid,
      subCollection: CollectionPath.instance.userCart,
    );
    List<ProductModel> products = data
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
