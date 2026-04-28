import 'package:snap_shot/features/authentication/data/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

abstract class AuthRemoteDataSource {
  Future<String> sendOtp({required String phoneNumber});
  Future<void> verifyOtp({required VerifyOtpParam request});
  Future<String?> signUp({required UserModel userData});
  Future<UserModel> getUserData({required String uid});
  Future<String?> signIn({required String email, required String password});
  Future<void> createUserData({
    required String uid,
    required UserModel userData,
  });
}
