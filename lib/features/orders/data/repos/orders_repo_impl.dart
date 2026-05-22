import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/orders/data/data%20source/local/orders_local_data_sorce.dart';
import 'package:snap_shot/features/orders/data/data%20source/remote/orders_remote_data_source.dart';
import 'package:snap_shot/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  final OrdersLocalDataSorce _localDataSorce;

  OrdersRepoImpl(this._remoteDataSource, this._localDataSorce);

  @override
  Stream<Result<List<OrderEntity>>> getUserOrders() async* {
    try {
      final stream = _remoteDataSource.getUserOrders();
      yield* stream.map((list) {
        final List<OrderEntity> orders = list.map((e) => e.toEntity()).toList();
        return Success(orders);
      });
    } catch (e) {
      if (e is FirebaseException) {
        yield AppFailure(FirestoreError.handleFireStoreError(e));
      }
      yield AppFailure(Failure(e.toString()));
    }
  }
}
