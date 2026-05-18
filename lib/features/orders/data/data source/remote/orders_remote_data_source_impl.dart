import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/features/orders/data/data%20source/remote/orders_remote_data_source.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;

  OrdersRemoteDataSourceImpl(this._remoteDataBaseServices);
  @override
  Future<List<OrderModel>> getUserOrders() async {
    String? uid = _remoteDataBaseServices.getUserId();
    if (uid == null) {
      return [];
    }
    final response = await _remoteDataBaseServices.getSubCollection(
      collection: CollectionPath.instance.allOrders,
      parentId: uid,
      subCollection: CollectionPath.instance.userOrders,
    );

    List<OrderModel> orders = response
        .map((e) => OrderModel.fromJson(e))
        .toList();
    return orders;
  }
}
