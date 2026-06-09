import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/features/owenr_all_orders/data/data_source/remote/owner_order_management_remote.dart';

class OwnerOrderManagementRemoteImpl implements OwnerOrderManagementRemote {
  final IRemoteDataBaseServices _dataBaseServices;

  OwnerOrderManagementRemoteImpl(this._dataBaseServices);
  @override
  Future<void> confirmOrder({required OrderModel order}) async {
    await _dataBaseServices.moveDocumentBetweenSubCollections(
      fromCollection: CollectionPath.instance.notConfirmedOrders,
      toCollection: CollectionPath.instance.confirmedOrders,
      parentId: order.userData!.uid,
      fromsubCollection: CollectionPath.instance.userNotConfirmedOrders,
      tosubCollection: CollectionPath.instance.userConfirmedOrders,
      childId: order.id,
      data: order.toJson(),
    );
  }

  @override
  Future<void> deleteConfirmedOrder({required OrderModel order}) async {
    await _dataBaseServices.deleteFromSubCollection(
      collection: CollectionPath.instance.confirmedOrders,
      parentId: order.userData!.uid,
      subCollection: CollectionPath.instance.userConfirmedOrders,
      childId: order.id,
    );
  }

  @override
  Future<void> deleteNotConfirmedOrder({required OrderModel order}) async {
    await _dataBaseServices.deleteFromSubCollection(
      collection: CollectionPath.instance.notConfirmedOrders,
      parentId: order.userData!.uid,
      subCollection: CollectionPath.instance.userNotConfirmedOrders,
      childId: order.id,
    );
  }
}
