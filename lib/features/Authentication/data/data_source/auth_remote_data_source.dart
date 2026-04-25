import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

abstract class AuthRemoteDataSource {
  Future<String> sendOtp({required String phoneNumber});
  Future<void> verifyOtp({required VerifyOtpParam request});
  Future<String?> signUp({required SignUpParam request});
}
