import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/favorites/data/data_source/local/fav_local_data_source.dart';

class FavProudctsLocalDataSourceImpl implements FavProductsLocalDataSource {
  const FavProudctsLocalDataSourceImpl(
    this._favProductsBox,
    this._allProductsBox,
    this._userId,
  );
  final ILocalDataBaseServices<ProductModel> _favProductsBox;
  final ILocalDataBaseServices<ProductModel> _allProductsBox;
  final ILocalDataBaseServices<UserModel> _userId;

  @override
  List<ProductModel> getFavProducts() {
    return _favProductsBox.getAllData();
  }

  @override
  Future<void> saveFavProducts({required List<ProductModel> products}) async {
    await _favProductsBox.clear();
    for (var product in products) {
      await _favProductsBox.addDataWithKey(key: product.id!, data: product);
    }
  }

  @override
  String? getUserId() {
    final userData = _userId.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }

  @override
  Future<void> updateFavProduct({
    required String productId,
    required bool isFav,
  }) async {
    final ProductModel? existingProduct = await _allProductsBox.getData(
      key: productId,
    );

    if (existingProduct != null) {
      final updatedProduct = ProductModel(
        id: existingProduct.id,
        name: existingProduct.name,
        price: existingProduct.price,
        description: existingProduct.description,
        category: existingProduct.category,
        imageUrl: existingProduct.imageUrl,
        rate: existingProduct.rate,
        isFav: isFav,
        inCart: existingProduct.inCart,
        brand: existingProduct.brand,
        stock: existingProduct.stock,
        counter: existingProduct.counter,
      );

      await _allProductsBox.addDataWithKey(
        key: productId,
        data: updatedProduct,
      );
    }
  }

  @override
  Future<void> clearFavIds() async {
    return await _favProductsBox.clear();
  }

  @override
  Future<void> addFavProduct({required ProductModel product}) async {
    await _favProductsBox.addDataWithKey(key: product.id!, data: product);
  }

  @override
  Future<void> removeFavProduct({required String id}) async {
    await _favProductsBox.delete(key: id);
  }
}
