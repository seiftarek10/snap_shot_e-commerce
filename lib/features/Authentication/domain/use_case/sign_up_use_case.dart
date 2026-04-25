import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';

class SignUpUseCase extends UseCase<void, UserEntity> {
   final AuthRepo authRepo;

  SignUpUseCase( this.authRepo);

  @override
  Future<Result<void>> call(UserEntity userData) async {
    return await authRepo.signUp(userData: userData);
  }
}
