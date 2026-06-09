import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/utils/result.dart';

abstract class OwnerOrderManagementRepo {
  Future<Result<void>> confirmOrder({required OrderEntity order});
  Future<Result<void>> deleteConfirmedOrder({required OrderEntity order});
  Future<Result<void>> deleteNotConfirmedOrder({required OrderEntity order});
  
}
