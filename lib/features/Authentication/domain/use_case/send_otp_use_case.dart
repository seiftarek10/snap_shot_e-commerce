import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';

class SendOtpUseCase extends FutureUseCase<String, String> {
  final AuthRepo _authRepo;

  SendOtpUseCase(this._authRepo);
  @override
  Future<Result<String>> call(String param) async {
    return await _authRepo.sendOtp(phoneNumber: param);
  }
}
