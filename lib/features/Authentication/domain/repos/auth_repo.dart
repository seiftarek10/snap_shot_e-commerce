import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

abstract class AuthRepo {
  Future<Result<String>> sendOtp({required String phoneNumber});
  Future<Result<void>> verifyOtp({required VerifyOtpParam request});
  Future<Result<void>> signUp({required SignUpParam request});
  
}
