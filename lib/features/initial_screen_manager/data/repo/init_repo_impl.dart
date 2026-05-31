import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/initial_screen_manager/data/data_source/init_local_data_source.dart';
import 'package:snap_shot/features/initial_screen_manager/domain/repo/init_app_repo.dart';

class InitAppRepoImpl implements InitAppRepo {
  final InitAppLocalDataSource _localDataSource;

  InitAppRepoImpl(this._localDataSource);
  @override
  Future<Result<bool>> isFirstTime() async {
    try {
      bool isFirstTime = await _localDataSource.isFirstTime();
      return Success(isFirstTime);
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }
  
  @override
  Result<bool> isLoggedIn() {
    try {
      bool isLoggedIn = _localDataSource.isLoggedIn();
      return Success(isLoggedIn);
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }
}
