part of 'get_favorites_products_cubit.dart';

@immutable
sealed class GetFavoritesProductsState {
  const GetFavoritesProductsState();
}

final class GetFavoritesProductsInitial extends GetFavoritesProductsState {
  const GetFavoritesProductsInitial();
}

final class GettingFavoritesProudcts extends GetFavoritesProductsState {
  const GettingFavoritesProudcts();
}

final class LoaddedFavProucts extends GetFavoritesProductsState {
  const LoaddedFavProucts({required this.products});
  final List<ProductEntity> products;
}

final class GetFavProuctsFailure extends GetFavoritesProductsState {
  const GetFavProuctsFailure(this.errMessage);
  final String errMessage;
}

final class AddedToFavProducts extends GetFavoritesProductsState {
  const AddedToFavProducts();
}

final class FailedAddToFav extends GetFavoritesProductsState {
  const FailedAddToFav(this.errMessage);
  final String errMessage;
}

final class RemovedFromFavProducts extends GetFavoritesProductsState {
  const RemovedFromFavProducts();
}

final class FailedRemoveFromFav extends GetFavoritesProductsState {
  const FailedRemoveFromFav(this.errMessage);
  final String errMessage;
}
