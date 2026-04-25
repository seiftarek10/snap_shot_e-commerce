import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class FirebaseAuthServices implements AuthRemoteDataSource {
  @override
  Future<String?> signUp({required SignUpParam request}) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
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
      verificationId: request.veificationId,
      smsCode: request.otp,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
