import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class VerifyOtpUseCase extends FutureUseCase<void, VerifyOtpParam> {
  final AuthRepo _authRepo;

  VerifyOtpUseCase(this._authRepo);
  @override
  Future<Result<void>> call(VerifyOtpParam param) async {
    return await _authRepo.verifyOtp(request: param);
  }
}
