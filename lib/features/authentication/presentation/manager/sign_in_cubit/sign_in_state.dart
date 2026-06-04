part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {
  const SignInState();
}

final class SignInInitial extends SignInState {
  const SignInInitial();
}

final class SignInLoading extends SignInState {
  const SignInLoading();
}

final class SignInSuccess extends SignInState {
  const SignInSuccess();
}

final class SignInFailure extends SignInState {
  const SignInFailure(this.errorMessage);
  final String errorMessage;
}
