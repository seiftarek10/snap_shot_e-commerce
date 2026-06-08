import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/data/data_source/remote/all_orders_remote_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/domain/repos/all_orders_repo.dart';
import 'package:snap_shot/core/utils/result.dart';

class AllOrdersRepoImpl implements AllOrdersRepo {
  final AllOrdersRemoteDataSource _remoteDataSource;

  AllOrdersRepoImpl(this._remoteDataSource);

  @override
  Stream<Result<List<OrderEntity>>> getAllOrders() async* {
    try {
      await for (final remoteOrders in _remoteDataSource.getAllOrders()) {
        if (remoteOrders.isEmpty) {
          yield const Success([]);
          continue; // Move to next stream emission
        }
        try {
          final List<OrderEntity> entities = remoteOrders
              .map((e) => e.toEntity())
              .toList();

          yield Success(entities);
        } catch (mappingError) {
          yield AppFailure(
            Failure("Data Mapping Error: ${mappingError.toString()}"),
          );
        }
      }
    } catch (streamError) {
      if (streamError is FirebaseException) {
        yield AppFailure(FirestoreError.handleFireStoreError(streamError));
      } else {
        yield AppFailure(Failure(streamError.toString()));
      }
    }
  }
}
