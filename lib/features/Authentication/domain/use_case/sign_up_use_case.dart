import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

class SignUpUseCase extends UseCase<void, SignUpParam> {
   final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});

  @override
  Future<Result<void>> call(SignUpParam param) async {
    return await authRepo.signUp(request: param);
  }
}
