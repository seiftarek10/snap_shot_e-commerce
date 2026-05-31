part of 'get_all_orders_cubit.dart';

@immutable
sealed class GetAllOrdersState {
  const GetAllOrdersState();
}

final class GetAllOrdersInitial extends GetAllOrdersState {
  const GetAllOrdersInitial();
}

final class GettingUserOrders extends GetAllOrdersState {
  const GettingUserOrders();
}
final class UserOrdersLoadded extends GetAllOrdersState {
  const UserOrdersLoadded(this.orders);
  final List<OrderEntity> orders;
}

final class FailedToLoadOrders extends GetAllOrdersState {
  const FailedToLoadOrders(this.errMessage);
  final String errMessage;
}


