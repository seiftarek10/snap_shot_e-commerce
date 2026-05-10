part of 'user_cart_manager_cubit.dart';

@immutable
sealed class UserCartManagerState {
  const UserCartManagerState();
}

final class UserHomeCartInitial extends UserCartManagerState {
  const UserHomeCartInitial();
}

final class UserHomeCartLoading extends UserCartManagerState {
  const UserHomeCartLoading();
}

final class AddToCartSuccess extends UserCartManagerState {
  const AddToCartSuccess({required this.id});
  final String id;
}

final class AddToCartFailure extends UserCartManagerState {
  const AddToCartFailure({required this.errMessage});
  final String errMessage;
}

final class RemoveFromCartSuccess extends UserCartManagerState {
  const RemoveFromCartSuccess({required this.id});
  final String id;
}

final class RemoveFromCartFailure extends UserCartManagerState {
  const RemoveFromCartFailure({required this.errMessage});
  final String errMessage;
}
