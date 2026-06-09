import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/cart/data/data_source/local/cart_local_data_source.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final ILocalDataBaseServices<ProductModel> _cartBox;
  final ILocalDataBaseServices<ProductModel> _favBox;
  final ILocalDataBaseServices<ProductModel> _productsBox;
  final ILocalDataBaseServices<UserModel> _user;

  CartLocalDataSourceImpl(
    this._cartBox,
    this._productsBox,
    this._user,
    this._favBox,
  );
  @override
  List<ProductModel> getLoaclCartProducts() {
    return _cartBox.getAllData();
  }

  @override
  Future<void> saveCartProducts(List<ProductModel> products) async {
    await _cartBox.clear();
    await _cartBox.addAllData(data: products);
  }

  @override
  String? getUid() {
    final userData = _user.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }

  @override
  Future<void> clearCartProducts() async {
    await _cartBox.clear();
  }

  @override
  Future<void> removeFromCart({required String id}) async {
    await _cartBox.delete(key: id);
    await _updateInFavBox(productId: id, inCart: false);
  }

  @override
  Future<void> addtoCart({required ProductModel product}) async {
    await _cartBox.addDataWithKey(key: product.id!, data: product);
    await _updateInFavBox(productId: product.id!, inCart: true);
  }

  @override
  Future<void> updateCartProduct({
    required String productId,
    required bool isInCart,
  }) async {
    final ProductModel? existingProduct = await _productsBox.getData(
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
        isFav: existingProduct.isFav,
        inCart: isInCart,
        brand: existingProduct.brand,
        stock: existingProduct.stock,
        counter: existingProduct.counter,
      );

      await _productsBox.addDataWithKey(key: productId, data: updatedProduct);
    }
    if (_favBox.containsKey(key: productId)) {}
  }

  Future<void> _updateInFavBox({
    required String productId,
    required bool inCart,
  }) async {
    final ProductModel? existinginFavProduct = await _favBox.getData(
      key: productId,
    );
    if (existinginFavProduct != null) {
      final updatedProduct = ProductModel(
        id: existinginFavProduct.id,
        name: existinginFavProduct.name,
        price: existinginFavProduct.price,
        description: existinginFavProduct.description,
        category: existinginFavProduct.category,
        imageUrl: existinginFavProduct.imageUrl,
        rate: existinginFavProduct.rate,
        isFav: existinginFavProduct.isFav,
        inCart: inCart,
        brand: existinginFavProduct.brand,
        stock: existinginFavProduct.stock,
        counter: existinginFavProduct.counter,
      );
      await _favBox.addDataWithKey(
        key: updatedProduct.id!,
        data: updatedProduct,
      );
    }
  }
}
