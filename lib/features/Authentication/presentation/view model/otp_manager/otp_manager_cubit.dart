import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/verify_otp_param.dart';
import 'package:snap_shot/features/authentication/domain/use_case/send_otp_use_case.dart';
import 'package:snap_shot/features/authentication/domain/use_case/verify_otp_use_case.dart';

part 'otp_manager_state.dart';

class OtpManagerCubit extends BaseCubit<OtpManagerState> {
  OtpManagerCubit(
    SendOtpUseCase sendOtpUseCase,
    VerifyOtpUseCase verifyOtpUseCase,
  ) : _sendOtpUseCase = sendOtpUseCase,
      _verifyOtpUseCase = verifyOtpUseCase,
      super(OtpManagerInitial());

  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  Future<void> sendOtp({required String phoneNumber}) async {
    safeEmit(OtpManagerLoading());
    final result = await _sendOtpUseCase.call(phoneNumber);
    if (result is Success<String>) {
      safeEmit(SendOtpSuccess(verificationId: result.data));
    } else if (result is ErrorCase<String>) {
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
    } else if (result is ErrorCase<void>) {
      safeEmit(VerifyOtpFailure(errMessaga: result.failure.errMessage));
    }
  }
}
