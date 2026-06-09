part of 'get_all_user_orders_cubit.dart';

@immutable
sealed class GetAllUserOrdersState {
  const GetAllUserOrdersState();
}

final class GetAllOrdersInitial extends GetAllUserOrdersState {
  const GetAllOrdersInitial();
}

final class GettingUserOrders extends GetAllUserOrdersState {
  const GettingUserOrders();
}

final class UserOrdersLoadded extends GetAllUserOrdersState {
  const UserOrdersLoadded(this.orders);
  final List<OrderEntity> orders;
}

final class FailedToLoadOrders extends GetAllUserOrdersState {
  const FailedToLoadOrders(this.errMessage);
  final String errMessage;
}
