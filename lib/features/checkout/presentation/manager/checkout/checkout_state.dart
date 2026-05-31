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
  // ignore: prefer_const_constructors_in_immutables
  MakeOrderSuccess();
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

final class RequestPaymentSheet extends CheckoutState {
  const RequestPaymentSheet();
}

final class PaymentComplete extends CheckoutState {
  const PaymentComplete();
}

final class PaymentFailed extends CheckoutState {
  const PaymentFailed(this.errMessage);
  final String errMessage;
}
