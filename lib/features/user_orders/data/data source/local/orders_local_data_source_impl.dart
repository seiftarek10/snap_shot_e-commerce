import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/local/orders_local_data_sorce.dart';

class OrdersLocalDataSourceImpl implements OrdersLocalDataSorce {
  final ILocalDataBaseServices<OrderModel> _ordersBox;
  final ILocalDataBaseServices<UserModel> _userBox;
  final ILocalDataBaseServices<ProductModel> _cartBox;
  final ILocalDataBaseServices<ProductModel> _productsBox;

  OrdersLocalDataSourceImpl(
    this._ordersBox,
    this._userBox,
    this._cartBox,
    this._productsBox,
  );
  @override
  Future<void> saveUserOrders({required List<OrderModel> orders}) async {
    for (var order in orders) {
      await _ordersBox.addDataWithKey(key: order.id, data: order);
    }
  }

  @override
  List<OrderModel> getUserOrders() {
    return _ordersBox.getAllData();
  }

  @override
  String? getUid() {
    final userData = _userBox.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first.uid;
  }

  @override
  UserModel? getUserData() {
    final userData = _userBox.getAllData();
    if (userData.isEmpty) {
      return null;
    }
    return userData.first;
  }

  @override
  Future<void> clearOrdersBox() async {
    await _ordersBox.clear();
  }

  @override
  Future<void> clearCartBox() async {
    await _cartBox.clear();
  }

  @override
  Future<void> deleteOrder({required String id}) async {
    await _ordersBox.delete(key: id);
  }

  @override
  Future<void> updateOrder({required OrderModel order}) async {
    await _ordersBox.addDataWithKey(key: order.id, data: order);
  }

  @override
  Future<OrderModel?> getOrderById({required String id}) async {
    return await _ordersBox.getData(key: id);
  }

  @override
  Future<void> deleteOroderProductsFromCart({required List<String> ids}) async {
    for (var id in ids) {
      final product = await _productsBox.getData(key: id);

      ProductModel productModel = ProductModel(
        id: product!.id,
        name: product.name,
        category: product.category,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        rate: product.rate,
        isFav: product.isFav,
        inCart: false,
        brand: product.brand,
        stock: product.stock,
        counter: product.counter,
      );
      await _productsBox.addDataWithKey(key: id, data: productModel);
    }
  }
}
