part of 'user_home_cart_cubit.dart';

@immutable
sealed class UserHomeCartState {
  const UserHomeCartState();
}

final class UserHomeCartInitial extends UserHomeCartState {
  const UserHomeCartInitial();
}

final class UserHomeCartLoading extends UserHomeCartState {
  const UserHomeCartLoading();
}

final class AddToCartSuccess extends UserHomeCartState {
  const AddToCartSuccess({required this.id});
  final String id;
}

final class AddToCartFailure extends UserHomeCartState {
  const AddToCartFailure({required this.errMessage});
  final String errMessage;
}

final class RemoveFromCartSuccess extends UserHomeCartState {
  const RemoveFromCartSuccess({required this.id});
  final String id;
}

final class RemoveFromCartFailure extends UserHomeCartState {
  const RemoveFromCartFailure({required this.errMessage});
  final String errMessage;
}
