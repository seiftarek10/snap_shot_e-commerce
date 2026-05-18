part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessaga;

  SignUpFailure({required this.errMessaga});
}

final class SendOtpSuccess extends SignUpState {
  final String verificationId;

  SendOtpSuccess({required this.verificationId});
}

final class SendOtpFailure extends SignUpState {
  final String errMessaga;

  SendOtpFailure({required this.errMessaga});
}

final class VerifyOtpSuccess extends SignUpState {}

final class VerifyOtpFailure extends SignUpState {
  final String errMessaga;

  VerifyOtpFailure({required this.errMessaga});
}
