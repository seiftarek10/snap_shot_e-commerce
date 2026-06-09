import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/local/orders_local_data_sorce.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/remote/orders_remote_data_source.dart';
import 'package:snap_shot/features/user_orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements UserOrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  final OrdersLocalDataSorce _localDataSource;

  OrdersRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<void>> makeOrder({required OrderEntity order}) async {
    try {
      await _remoteDataSource.makeOrder(order: OrderModel.fromEntity(order));
      await _remoteDataSource.deleteProductsCart();
      List<String> productsIds = order.products.map((e) => e.id).toList();
      await _localDataSource.deleteOroderProductsFromCart(ids: productsIds);
      await _localDataSource.clearOrdersBox();
      await _localDataSource.clearCartBox();
      return const Success(null);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> getUserData() async {
    try {
      UserModel? userModel = _localDataSource.getUserData();
      userModel ??= await _remoteDataSource.getUserData();
      return Success(userModel!.toUSerEntity());
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<List<OrderEntity>>> getUserOrders() async {
    try {
      final localOrders = _localDataSource.getUserOrders();
      if (localOrders.isNotEmpty) {
        return Success(localOrders.map((e) => e.toEntity()).toList());
      }
      final data = await _remoteDataSource.getUserOrders();
      return Success(data.map((e) => e.toEntity()).toList());
    } on FirebaseException catch (e) {
      return AppFailure(FirestoreError.handleFireStoreError(e));
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }
}
