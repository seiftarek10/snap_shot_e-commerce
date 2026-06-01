part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {
  const GetAllProductsState();
}

final class GetAllProductsInitial extends GetAllProductsState {
  const GetAllProductsInitial();
}

final class GettingAllProducts extends GetAllProductsState {
  const GettingAllProducts();
}

final class GetProductsSuccess extends GetAllProductsState {
  const GetProductsSuccess(this.products);
  final List<ProductEntity> products;
}

final class GetProductsFailure extends GetAllProductsState {
  const GetProductsFailure(this.errMessage);
  final String errMessage;
}
