import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/utils/stripe_service.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/errors/fire_base_auth_errors.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sign_in_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final StripeService _stripeService;

  AuthRepoImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
    this._stripeService,
  );

  @override
  Future<Result<void>> signUp({required UserEntity userData}) async {
    String? userId;
    try {
      UserModel data = UserModel.fromEntity(userData);

      userId = await _authRemoteDataSource.signUp(userData: data);

      if (userId == null) {
        return AppFailure(const Failure('Failed to create account ID'));
      }
      data.uid = userId;
      String customerId = await _stripeService.createCustomerId(
        userName: data.userName,
      );
      data.customerId = customerId;

      await _authRemoteDataSource.createUserData(uid: userId, userData: data);
      await _authRemoteDataSource.incrementUserCounter();
      await _authLocalDataSource.saveUserData(userData: data);
      await _authLocalDataSource.setFirstTime();

      return const Success(null);
    } catch (e) {
      if (userId != null) {
        await _authRemoteDataSource.deleteUser(id: userId);
      }

      if (e is FirebaseAuthException) {
        return AppFailure(FirebaseAuthErrors.handleException(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<String>> sendOtp({required String phoneNumber}) async {
    try {
      final result = await _authRemoteDataSource.sendOtp(
        phoneNumber: phoneNumber,
      );
      return Success(result);
    } on FirebaseAuthException catch (e) {
      return AppFailure(FirebaseAuthErrors.handleException(e));
    } on Exception catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> verifyOtp({required VerifyOtpParam request}) async {
    try {
      await _authRemoteDataSource.verifyOtp(request: request);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return AppFailure(FirebaseAuthErrors.handleException(e));
    } on Exception catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }

  @override
  Future<Result<void>> signIn({required SignInParam request}) async {
    try {
      final response = await _authRemoteDataSource.signIn(
        email: request.email,
        password: request.password,
      );
      UserModel? userData = _authLocalDataSource.getUserData();
      if (userData?.uid == null ||
          userData == null ||
          userData.uid != response) {
        userData = await _authRemoteDataSource.getUserData(uid: response ?? '');
        await _authLocalDataSource.saveUserData(userData: userData);
        await _authLocalDataSource.setFirstTime();
      }
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return AppFailure(FirebaseAuthErrors.handleException(e));
    } catch (e) {
      return AppFailure(Failure(e.toString()));
    }
  }
}
