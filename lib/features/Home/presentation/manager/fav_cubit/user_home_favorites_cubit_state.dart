part of 'user_home_favorites_cubit_cubit.dart';

@immutable
sealed class UserHomeFavoritesCubitState {
  const UserHomeFavoritesCubitState();
}

final class FavoritesCubitInitial extends UserHomeFavoritesCubitState {
  const FavoritesCubitInitial();
}

final class AddFavoriteItemSuccess extends UserHomeFavoritesCubitState {
  const AddFavoriteItemSuccess();
}

final class AddFavoriteItemFailure extends UserHomeFavoritesCubitState {
  const AddFavoriteItemFailure({required this.errMessage});
  final String errMessage;
}

final class RemoveFavoriteItemSuccess extends UserHomeFavoritesCubitState {
  const RemoveFavoriteItemSuccess();
}

final class RemoveFavoriteItemFailure extends UserHomeFavoritesCubitState {
  const RemoveFavoriteItemFailure({required this.errMessage});
  final String errMessage;
}

final class Loading extends UserHomeFavoritesCubitState {}
