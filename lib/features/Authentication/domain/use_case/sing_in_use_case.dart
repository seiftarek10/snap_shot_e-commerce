import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sign_in_param.dart';

class SingInUseCase extends UseCase<void, SignInParam> {
  final AuthRepo _authRepo;

  SingInUseCase(this._authRepo);

  @override
  Future<Result<void>> call(SignInParam params) async {
    return await _authRepo.signIn(request: params);
  }
}
