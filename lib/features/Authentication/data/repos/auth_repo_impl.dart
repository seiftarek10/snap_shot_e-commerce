import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/data/data_source/utils/fire_base_auth_errors.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Result<void>> signUp({required SignUpParam request}) async {
    try {
      await _authRemoteDataSource.signUp(request: request);
      // ignore: void_checks
      return const Success('');
    } on FirebaseAuthException catch (e) {
      return ErrorCase(FirebaseAuthErrors.handleException(e));
    }
  }
}
