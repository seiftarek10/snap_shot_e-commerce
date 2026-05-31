part of 'get_all_products_cubit.dart';

@immutable
sealed class UserHomeProudctsState {
  const UserHomeProudctsState();
}

final class GetAllProductsInitial extends UserHomeProudctsState {
  const GetAllProductsInitial();
}

final class GettingAllProducts extends UserHomeProudctsState {
  const GettingAllProducts();
}

final class GetProductsSuccess extends UserHomeProudctsState {
  const GetProductsSuccess(this.products);
  final List<ProductEntity> products;
}

final class GetProductsFailure extends UserHomeProudctsState {
  const GetProductsFailure(this.errMessage);
  final String errMessage;
}
