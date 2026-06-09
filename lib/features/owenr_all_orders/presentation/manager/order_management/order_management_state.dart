part of 'order_management_cubit.dart';

@immutable
sealed class OrderManagementState {
  const OrderManagementState();
}

final class OrderManagementInitial extends OrderManagementState {
  const OrderManagementInitial();
}

final class OrderManagementConfirmLoading extends OrderManagementState {
  const OrderManagementConfirmLoading();
}

final class DeleteConfirmLoading extends OrderManagementState {
  const DeleteConfirmLoading();
}
final class DeleteNotConfirmLoading extends OrderManagementState {
  const DeleteNotConfirmLoading();
}

final class OrderManagementSuccess extends OrderManagementState {
  const OrderManagementSuccess();
}

final class DeleteOrderSuccess extends OrderManagementState {
  const DeleteOrderSuccess();
}

final class OrderManagementFailure extends OrderManagementState {
  const OrderManagementFailure(this.errMessage);
  final String errMessage;
}
