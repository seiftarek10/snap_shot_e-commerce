part of 'init_app_cubit.dart';

@immutable
sealed class InitAppState {
  const InitAppState();
}

final class InitAppInitial extends InitAppState {
  const InitAppInitial();
}

final class InitAppLoading extends InitAppState {
  const InitAppLoading();
}

final class IsFirstTime extends InitAppState {
  const IsFirstTime();
}

final class IsNotFirstTimeAndLoggedIn extends InitAppState {
  const IsNotFirstTimeAndLoggedIn();
}

final class IsNotFirstTimeAndNotLoggedIn extends InitAppState {
  const IsNotFirstTimeAndNotLoggedIn();
}

final class InitAppFailure extends InitAppState {
  final String errMessage;
  const InitAppFailure(this.errMessage);
}
