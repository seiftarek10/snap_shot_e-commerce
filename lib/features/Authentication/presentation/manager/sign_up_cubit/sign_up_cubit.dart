import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/sign_up_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  SignUpCubit(this._signUpUseCase, sendOtpUseCase, verifyOtpUseCase)
    : _sendOtpUseCase = sendOtpUseCase,
      _verifyOtpUseCase = verifyOtpUseCase,
      super(SignUpInitial());
  final SignUpUseCase _signUpUseCase;

  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  Future<void> signUp({required UserEntity userData}) async {
    safeEmit(SignUpLoading());
    final result = await _signUpUseCase.call(userData);
    if (result is Success) {
      safeEmit(SignUpSuccess());
    } else if (result is AppFailure) {
      safeEmit(SignUpFailure(errMessaga: result.failure.errMessage));
    }
  }

  Future<void> sendOtp({required String phoneNumber}) async {
    safeEmit(SignUpLoading());
    final result = await _sendOtpUseCase.call(phoneNumber);
    if (result is Success<String>) {
      safeEmit(SendOtpSuccess(verificationId: result.data));
    } else if (result is AppFailure<String>) {
      safeEmit(SendOtpFailure(errMessaga: result.failure.errMessage));
    }
  }

  Future<void> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    final result = await _verifyOtpUseCase.call(
      VerifyOtpParam(verificationId: verificationId, otp: otp),
    );
    if (result is Success<void>) {
      safeEmit(VerifyOtpSuccess());
    } else if (result is AppFailure<void>) {
      safeEmit(VerifyOtpFailure(errMessaga: result.failure.errMessage));
    }
  }
}
