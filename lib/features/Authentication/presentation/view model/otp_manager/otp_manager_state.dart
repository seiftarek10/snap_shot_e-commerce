part of 'otp_manager_cubit.dart';

@immutable
sealed class OtpManagerState {}

final class OtpManagerInitial extends OtpManagerState {}
final class OtpManagerLoading extends OtpManagerState {}

final class SendOtpSuccess extends OtpManagerState {
  final String verificationId;

  SendOtpSuccess({required this.verificationId});
}

final class SendOtpFailure extends OtpManagerState {
  final String errMessaga;

  SendOtpFailure({required this.errMessaga});
}

final class VerifyOtpSuccess extends OtpManagerState {}

final class VerifyOtpFailure extends OtpManagerState {
  final String errMessaga;

  VerifyOtpFailure({required this.errMessaga});
}
