import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_source.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/repos/all_users_repo.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

class AllUsersRepoImpl implements AllUsersRepo {
  final AllUsersRemoteDataSource _remoteDataSource;
  final AllUsersLocalDataSource _localDataSource;

  AllUsersRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<UserEntity>>> getAllUsers({
    required GetAllUserParams params,
  }) async {
    try {
      List<String> usersIds = _localDataSource.getAllUsersIds(
        limit: params.limit,
        lastId: params.lastId,
      );
      if (usersIds.isNotEmpty) {
        List<UserModel> localUsers = await _localDataSource.getAllUsers(
          usersIds: usersIds,
        );
        List<UserEntity> users = localUsers
            .map((e) => e.toUSerEntity())
            .toList();
        return Success(users);
      }
      List<UserModel> data = await _remoteDataSource.getAllUsers(
        limit: params.limit,
        lastId: params.lastId,
      );
      List<UserEntity> users = data.map((e) => e.toUSerEntity()).toList();
      await _localDataSource.cacheAllUsers(users: data);
      return Success(users);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> syncCacheWithRemote() async {
    try {
      String? locatUpdatedTime = await _localDataSource.getLastUpdateTime();
      String remoteUpdatedTime = await _remoteDataSource.getLastUpdateTime();
      if (locatUpdatedTime == null) {
        locatUpdatedTime = await _remoteDataSource.getLastUpdateTime();
        await _localDataSource.updateLastUpdateTime(
          lastUpdateTime: locatUpdatedTime,
        );
      }

      if (locatUpdatedTime.toLowerCase() != remoteUpdatedTime.toLowerCase()) {
        await _localDataSource.clearUsersIds();
        await _localDataSource.clearUsersBox();
        await _localDataSource.updateLastUpdateTime(
          lastUpdateTime: remoteUpdatedTime,
        );
      }
      return const Success(null);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
