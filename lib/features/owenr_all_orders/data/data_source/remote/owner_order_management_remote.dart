import 'package:snap_shot/core/models/order_model.dart';

abstract class OwnerOrderManagementRemote {
  Future<void> confirmOrder({required OrderModel order});
  Future<void> deleteConfirmedOrder({required OrderModel order});
  Future<void> deleteNotConfirmedOrder({required OrderModel order});
}
