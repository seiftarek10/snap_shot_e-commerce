import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/repo/init_app_repo.dart';

class IsFirstTimeUseCase extends FutureUseCase<bool, void> {
  final InitAppRepo _repo;

  IsFirstTimeUseCase(this._repo);

  @override
  Future<Result<bool>> call(void param) async {
    return _repo.isFirstTime();
  }
}
