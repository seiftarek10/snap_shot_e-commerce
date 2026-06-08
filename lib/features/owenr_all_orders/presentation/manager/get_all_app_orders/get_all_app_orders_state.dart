part of 'get_all_app_orders_cubit.dart';

@immutable
sealed class GetAllAppOrdersState {
  const GetAllAppOrdersState();
}

final class GetAllOrdersInitial extends GetAllAppOrdersState {
  const GetAllOrdersInitial();
}

final class GetAllOrdersLoading extends GetAllAppOrdersState {
  const GetAllOrdersLoading();
}

final class GetAllOrdersSuccess extends GetAllAppOrdersState {
  const GetAllOrdersSuccess(this.orders);
  final List<OrderEntity> orders;
}

final class GetAllOrdersFailure extends GetAllAppOrdersState {
  const GetAllOrdersFailure(this.errMessage);
  final String errMessage;
}
