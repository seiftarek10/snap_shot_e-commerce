import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

abstract class AuthRepo {
  Future<Result<void>> signUp({required SignUpParam request});
}
