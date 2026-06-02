import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/domain/repos/all_users_repo.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

class GetAllUserUseCase extends FutureUseCase<List<UserEntity>, GetAllUserParams> {
  final AllUsersRepo _allUsersRepo;

  GetAllUserUseCase(this._allUsersRepo);
  @override
  Future<Result<List<UserEntity>>> call(GetAllUserParams params) async {
    return await _allUsersRepo.getAllUsers(params: params);
  }
}


class GetAllUserParams {
  final int limit;
  final String? lastId;

  GetAllUserParams({
    required this.limit,
    required this.lastId,
  });
}