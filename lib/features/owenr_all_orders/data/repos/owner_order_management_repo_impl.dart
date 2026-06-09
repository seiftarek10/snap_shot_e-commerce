import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owenr_all_orders/data/data_source/remote/owner_order_management_remote.dart';
import 'package:snap_shot/features/owenr_all_orders/domain/repos/owner_order_management_repo.dart';

class OwnerOrderManagementRepoImpl implements OwnerOrderManagementRepo {
  final OwnerOrderManagementRemote _remote;

  OwnerOrderManagementRepoImpl(this._remote);
  @override
  Future<Result<void>> confirmOrder({required OrderEntity order}) async {
    try {
      await _remote.confirmOrder(order: OrderModel.fromEntity(order));
      return const Success(null);
    } on FirebaseException catch (e) {
      return AppFailure(FirestoreError.handleFireStoreError(e));
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteConfirmedOrder({
    required OrderEntity order,
  }) async {
    try {
      await _remote.deleteConfirmedOrder(order: OrderModel.fromEntity(order));
      return const Success(null);
    } on FirebaseException catch (e) {
      return AppFailure(FirestoreError.handleFireStoreError(e));
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteNotConfirmedOrder({
    required OrderEntity order,
  }) async {
    try {
      await _remote.deleteNotConfirmedOrder(
        order: OrderModel.fromEntity(order),
      );
      return const Success(null);
    } on FirebaseException catch (e) {
      return AppFailure(FirestoreError.handleFireStoreError(e));
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }
}
