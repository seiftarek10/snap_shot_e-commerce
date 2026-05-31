import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/repo/init_app_repo.dart';

class IsLoggedInUseCase extends UseCase<bool, void> {
  final InitAppRepo _initAppRepo;

  IsLoggedInUseCase(this._initAppRepo);

  @override
  Result<bool> call(void params) {
    return _initAppRepo.isLoggedIn();
  }
}
