import 'package:snap_shot/core/utils/result.dart';

abstract class InitAppRepo {
  Future<Result<bool>> isFirstTime();
  Result<bool> isLoggedIn();
}
