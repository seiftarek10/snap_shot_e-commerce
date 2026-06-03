import 'package:firebase_core/firebase_core.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
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
  Future<Result<List<UserEntity>>> getAllUsers({required GetAllUserParams params}) async{
   try {
     final localUsersIds = _localDataSource.getAllUsersIds(limit: params.limit, lastId: params.lastId);
     if (localUsersIds.isEmpty) {
       final remoteUsers = await _remoteDataSource.getAllUsers(limit: params.limit, lastId: params.lastId);
       await _localDataSource.cacheAllUsers(users: remoteUsers);
       List<UserEntity> usersEntities = remoteUsers.map((e)=>e.toUSerEntity()).toList();
       return Success(usersEntities);
     } else {
       final localUsers = await _localDataSource.getAllUsers(usersIds: localUsersIds);
       List<UserEntity> usersEntities = localUsers.map((e)=>e.toUSerEntity()).toList();
       return Success(usersEntities);
     }  
   } catch (e) {
    if(e is FirebaseException){
      return AppFailure(FirestoreError.handleFireStoreError(e));
    }
     return AppFailure(Failure(e.toString()));
   }
  }
}
