import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/features/cart/data/data_source/remote/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final IRemoteDataBaseServices _dataBaseServices;

  CartRemoteDataSourceImpl(this._dataBaseServices);
  @override
  Future<List<ProductModel>> getCartProducts({required String uid}) async {
    final response = await _dataBaseServices.getSubCollection(
      collection: CollectionPath.instance.allCart,
      parentId: uid,
      subCollection: CollectionPath.instance.userCart,
    );
    List<ProductModel> products = response
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
