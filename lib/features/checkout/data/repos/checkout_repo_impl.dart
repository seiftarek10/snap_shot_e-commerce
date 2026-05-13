import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/data/data_source/local/checkout_local_data_source.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source.dart';
import 'package:snap_shot/features/checkout/data/models/order_model.dart';
import 'package:snap_shot/features/checkout/domain/entity/order_entity.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource _remoteDataSource;
  final CheckoutLocalDataSource _localDataSource;

  CheckoutRepoImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<Result<void>> makeOrder({required OrderEntity order}) async {
    try {
      String? uid = _localDataSource.getUserid();
      uid ??= _remoteDataSource.getUserId();
      await _remoteDataSource.makeOrder(order: OrderModel.fromEntity(order));
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
}
