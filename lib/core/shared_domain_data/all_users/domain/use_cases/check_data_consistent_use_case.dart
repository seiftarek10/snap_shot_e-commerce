import 'package:snap_shot/core/shared_domain_data/all_users/domain/repos/all_users_repo.dart';
import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';

class SyncCacheWithRemoteUseCase extends FutureUseCase<void, void> {
  final AllUsersRepo _repo;

  SyncCacheWithRemoteUseCase(this._repo);
  @override
  Future<Result<void>> call(void param) async {
    return await _repo.syncCacheWithRemote();
  }
}
