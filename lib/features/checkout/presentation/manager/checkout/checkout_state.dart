part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

final class MakeOrderLoading extends CheckoutState {
  const MakeOrderLoading();
}

final class MakeOrderSuccess extends CheckoutState {
  const MakeOrderSuccess();
}

final class MakeOrderFailure extends CheckoutState {
  const MakeOrderFailure(this.errMessage);
  final String errMessage;
}

final class GettingUserData extends CheckoutState {
  const GettingUserData();
}

final class GetUserDataSuccess extends CheckoutState {
  const GetUserDataSuccess(this.user);
  final UserEntity user;
}

final class FailedToGetUserData extends CheckoutState {
  const FailedToGetUserData(this.errMessage);
  final String errMessage;
}
