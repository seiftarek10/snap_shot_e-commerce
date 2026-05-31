part of 'get_cart_proudcts_cubit.dart';

@immutable
sealed class GetCartProudctsState {
  const GetCartProudctsState();
}

final class GetCartProudctsInitial extends GetCartProudctsState {
  const GetCartProudctsInitial();
}

final class GettingCartProudcts extends GetCartProudctsState {
  const GettingCartProudcts();
}

final class CartProudctsLoadded extends GetCartProudctsState {
  const CartProudctsLoadded(this.products);
  final List<ProductEntity> products;
}

final class FailedLoadCartProducts extends GetCartProudctsState {
  const FailedLoadCartProducts(this.errMessage);
  final String errMessage;
}
