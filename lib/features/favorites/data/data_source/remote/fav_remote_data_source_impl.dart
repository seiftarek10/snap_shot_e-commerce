import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/features/favorites/data/data_source/remote/fav_remote_data_source.dart';

class FavProuctsRemoteDataSourceImpl implements FavProductsRemoteDataSource {
  const FavProuctsRemoteDataSourceImpl(this._iRemoteDataBaseServices);
  final IRemoteDataBaseServices _iRemoteDataBaseServices;

  @override
  Future<List<ProductModel>> getFavProducts({required String uid}) async {
    final result = await _iRemoteDataBaseServices.getSubCollection(
      collection: CollectionPath.instance.allFavProducts,
      parentId: uid,
      subCollection: CollectionPath.instance.userFavProducts,
    );
    final List<ProductModel> products = result
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }

  @override
  Future<void> addFavProduct({
    required String uid,
    required ProductModel product,
  }) async {
    final result = await _iRemoteDataBaseServices.addToSubCollectionWithId(
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
    await _iRemoteDataBaseServices.deleteFromSubCollection(
      collection: CollectionPath.instance.allFavProducts,
      parentId: uid,
      subCollection: CollectionPath.instance.userFavProducts,
      childId: prodcutId,
    );
  }
}
