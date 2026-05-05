part of 'favorites_cubit_cubit.dart';

@immutable
sealed class FavoritesCubitState {}

final class FavoritesCubitInitial extends FavoritesCubitState {}

final class AddFavoriteItemSuccess extends FavoritesCubitState {}

final class AddFavoriteItemFailure extends FavoritesCubitState {
  final String errMessage;

  AddFavoriteItemFailure({required this.errMessage});
}

final class RemoveFavoriteItemSuccess extends FavoritesCubitState {}

final class RemoveFavoriteItemFailure extends FavoritesCubitState {
  final String errMessage;

  RemoveFavoriteItemFailure({required this.errMessage});
}

final class Loading extends FavoritesCubitState {}
