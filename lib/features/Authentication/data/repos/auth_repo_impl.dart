import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_local_data_source.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/data/data_source/utils/fire_base_auth_errors.dart';
import 'package:snap_shot/features/authentication/data/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/repos/auth_repo.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sign_in_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Result<void>> signUp({required UserEntity userData}) async {
    try {
      UserModel data = UserModel.fromEntity(userData);
      String? uid = await _authRemoteDataSource.signUp(userData: data);
      await _authRemoteDataSource.createUserData(
        uid: uid ?? '',
        userData: data,
      );
      data.uid = uid ?? '';
      await _authLocalDataSource.saveUserData(userData: data.toUSerEntity());
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return ErrorCase(FirebaseAuthErrors.handleException(e));
    } on Exception catch (e) {
      log(e.toString());
      return ErrorCase(Failure(errMessage: e.toString()));
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
      return ErrorCase(FirebaseAuthErrors.handleException(e));
    } on Exception catch (e) {
      return ErrorCase(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Result<void>> verifyOtp({required VerifyOtpParam request}) async {
    try {
      await _authRemoteDataSource.verifyOtp(request: request);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return ErrorCase(FirebaseAuthErrors.handleException(e));
    } on Exception catch (e) {
      return ErrorCase(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Result<void>> signIn({required SignInParam request}) async {
    try {
      final response = await _authRemoteDataSource.signIn(
        email: request.email,
        password: request.password,
      );
      UserModel userData = await _authRemoteDataSource.getUserData(
        uid: response ?? '',
      );
      await _authLocalDataSource.saveUserData(
        userData: userData.toUSerEntity(),
      );
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return ErrorCase(FirebaseAuthErrors.handleException(e));
    } catch (e) {
      return ErrorCase(
        Failure(errMessage: 'Something went wrong, please try again later'),
      );
    }
  }
}
