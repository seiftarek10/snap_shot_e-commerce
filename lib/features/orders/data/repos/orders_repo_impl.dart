import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/orders/data/data%20source/local/orders_local_data_sorce.dart';
import 'package:snap_shot/features/orders/data/data%20source/remote/orders_remote_data_source.dart';
import 'package:snap_shot/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  final OrdersLocalDataSorce _localDataSorce;

  OrdersRepoImpl(this._remoteDataSource, this._localDataSorce);
  @override
  Future<Result<List<OrderEntity>>> getUserOrders() async {
    try {
      List<OrderModel> data = _localDataSorce.getUserOrders();

      if (data.isEmpty) {
        data = await _remoteDataSource.getUserOrders();
        await _localDataSorce.saveUserOrders(orders: data);
      }
      List<OrderEntity> orders = data.map((e) => e.toEntity()).toList();
      return Success(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
