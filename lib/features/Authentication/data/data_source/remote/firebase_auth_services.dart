import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/data_source/remote_data_source/data_base_services_interfase.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/data/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class FirebaseAuthServices implements AuthRemoteDataSource {
  final IDataBaseServices _dataBaseServices;

  FirebaseAuthServices(this._dataBaseServices);
  @override
  Future<String?> signUp({required UserModel userData}) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userData.email,
      password: userData.password,
    );
    return result.user?.uid;
  }

  @override
  Future<String> sendOtp({required String phoneNumber}) async {
    Completer<String> completer = Completer<String>();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (verificationCompleted) {},
      verificationFailed: (v) {
        completer.completeError(v.message ?? 'An error occurred');
      },
      codeSent: (String verificationId, int? resentToken) {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (v) {
        completer.completeError('OTP verification timed out');
      },
    );
    return completer.future;
  }

  @override
  Future<void> verifyOtp({required VerifyOtpParam request}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: request.verificationId,
      smsCode: request.otp,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> createUserData({
    required String uid,
    required UserModel userData,
  }) async {
    await _dataBaseServices.addDataWithId(
      data: userData.toJson(),
      path: 'users',
      id: uid,
    );
  }
}
