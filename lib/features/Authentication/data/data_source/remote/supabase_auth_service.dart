import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService extends AuthRemoteDataSource {
  final IApiServices _dataBaseServices;

  SupabaseAuthService(this._dataBaseServices);
  @override
  Future<void> createUserData({
    required String uid,
    required UserModel userData,
  }) async {
    await _dataBaseServices.addDataWithId(
      id: uid,
      data: userData.toJson(),
      path: 'users',
    );
  }

  @override
  Future<String> sendOtp({required String phoneNumber}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> signUp({required UserModel userData}) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: userData.email,
      password: userData.password,
    );
    return response.user?.id;
  }

  @override
  Future<void> verifyOtp({required VerifyOtpParam request}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> signIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserData({required String uid}) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteUser({required String id}) {
    throw UnimplementedError();
  }
}
