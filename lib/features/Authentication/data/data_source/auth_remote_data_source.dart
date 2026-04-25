import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp({required SignUpParam request});
}
