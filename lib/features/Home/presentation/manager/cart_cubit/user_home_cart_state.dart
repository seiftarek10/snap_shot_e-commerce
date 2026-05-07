part of 'user_home_cart_cubit.dart';

@immutable
sealed class UserHomeCartState {}

final class UserHomeCartInitial extends UserHomeCartState {}

final class UserHomeCartLoading extends UserHomeCartState {}

final class AddToCartSuccess extends UserHomeCartState {}

final class AddToCartFailure extends UserHomeCartState {
  final String errMessage;

  AddToCartFailure({required this.errMessage});
}

final class RemoveFromCartSuccess extends UserHomeCartState {}

final class RemoveFromCartFailure extends UserHomeCartState {
  final String errMessage;

  RemoveFromCartFailure({required this.errMessage});
}

