import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/orders/data/data%20source/remote/orders_remote_data_source.dart';
import 'package:snap_shot/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepoImpl(this._remoteDataSource);
  @override
  Stream<Result<List<OrderEntity>>> getUserOrders() async* {
    try {
      await for (final list in _remoteDataSource.getUserOrders()) {
        final orders = list.map((e) => e.toEntity()).toList();

        yield Success<List<OrderEntity>>(orders);
      }
    } on FirebaseException catch (e) {
      yield AppFailure(FirestoreError.handleFireStoreError(e));
    } catch (e) {
      yield AppFailure(Failure(e.toString()));
    }
  }
}
