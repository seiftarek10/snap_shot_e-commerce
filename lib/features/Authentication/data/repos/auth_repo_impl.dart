import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/firebase_auth_errors.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Result<UserEntity>> signUp({required SignUpParam request}) async {
    try {
      final response = await _authRemoteDataSource.signUp(request: request);
      return Success(response);
    } on FirebaseAuthException catch(e) {
      return ErrorCase(FirebaseAuthErorrs.failure(e));
    }
  }
}
