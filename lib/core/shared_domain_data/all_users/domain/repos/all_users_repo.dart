import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/use_cases/get_all_user_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class AllUsersRepo {
  Future<Result<List<UserEntity>>> getAllUsers({
    required GetAllUserParams params
  });
}
