import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> signUp({required SignUpParam request});
}
