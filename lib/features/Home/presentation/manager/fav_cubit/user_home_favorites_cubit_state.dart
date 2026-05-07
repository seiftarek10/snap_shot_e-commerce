part of 'user_home_favorites_cubit_cubit.dart';

@immutable
sealed class UserHomeFavoritesCubitState {}

final class FavoritesCubitInitial extends UserHomeFavoritesCubitState {}

final class AddFavoriteItemSuccess extends UserHomeFavoritesCubitState {}

final class AddFavoriteItemFailure extends UserHomeFavoritesCubitState {
  final String errMessage;

  AddFavoriteItemFailure({required this.errMessage});
}

final class RemoveFavoriteItemSuccess extends UserHomeFavoritesCubitState {}

final class RemoveFavoriteItemFailure extends UserHomeFavoritesCubitState {
  final String errMessage;

  RemoveFavoriteItemFailure({required this.errMessage});
}

final class Loading extends UserHomeFavoritesCubitState {}
