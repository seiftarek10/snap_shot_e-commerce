import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/features/orders/data/data%20source/remote/orders_remote_data_source.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;

  OrdersRemoteDataSourceImpl(this._remoteDataBaseServices);
  @override
  Stream<List<OrderModel>> getUserOrders() {
    String? uid = _remoteDataBaseServices.getUserId();

    if (uid == null) {
      return const Stream.empty();
    }

    final data = _remoteDataBaseServices
        .getSubCollectionStream(
          collection: CollectionPath.instance.allOrders,
          id: uid,
          subCollection: CollectionPath.instance.userOrders,
        )
        .map((list) {
          return list.map((e) => OrderModel.fromJson(e)).toList();
        });
    return data;
  }
}
