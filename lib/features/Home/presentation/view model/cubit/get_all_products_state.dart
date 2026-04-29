part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class Loading extends GetAllProductsState {}

final class GetProductsSuccess extends GetAllProductsState {
  final List<ProductEntity> products;

  GetProductsSuccess(this.products);
}

final class GetProductsFailure extends GetAllProductsState {
  final String errMessage;

  GetProductsFailure(this.errMessage);
}
