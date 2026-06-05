import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';

class FirebaseAuthServices implements AuthRemoteDataSource {
  final IRemoteDataBaseServices _dataBaseServices;

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
    await _dataBaseServices.addWithId(
      data: userData.toJson(),
      collection: CollectionPath.instance.users,
      id: uid,
    );
  }

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user?.uid;
  }

  @override
  Future<UserModel> getUserData({required String uid}) async {
    final resopnse = await _dataBaseServices.getById(
      id: uid,
      collection: 'users',
    );
    return UserModel.fromJson(resopnse);
  }

  @override
  Future<void> deleteUser({required String id}) async {
    User user = FirebaseAuth.instance.currentUser!;
    await user.delete();
    await _dataBaseServices.delete(
      collection: CollectionPath.instance.users,
      id: id,
    );
  }

  @override
  Future<void> incrementUserCounter() async {
    String collection = CollectionPath.instance.statsData;
    const String docId = '1';

    String currentMonthKey = DateFormat('yyyy-MM').format(DateTime.now());

    final Map<String, dynamic> currentData = await _dataBaseServices.getById(
      collection: collection,
      id: docId,
    );

    if (currentData.isEmpty) {
      await _dataBaseServices.addWithId(
        collection: collection,
        id: docId,
        data: {
          'totalUsers': {
            'total': 1, //
            'monthlyHistory': {currentMonthKey: 1},
          },
          'totalOrders': {'total': 0, 'monthlyHistory': {}},
          'totalProducts': 0,
        },
      );
      return;
    }

    await _dataBaseServices.incrementField(
      collection: collection,
      fieldKey: 'totalUsers.total',
      value: 1,
    );

    await _dataBaseServices.incrementField(
      collection: collection,
      fieldKey: 'totalUsers.monthlyHistory.$currentMonthKey',
      value: 1,
    );
  }
}
