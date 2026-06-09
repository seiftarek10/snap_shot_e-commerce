import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_orders/data/data_source/remote/all_orders_remote_data_source.dart';

class AllOrdersRemoteDataSourceImpl implements AllOrdersRemoteDataSource {
  final IRemoteDataBaseServices _dataBaseServices;

  AllOrdersRemoteDataSourceImpl(this._dataBaseServices);

  @override
  Stream<List<OrderModel>> getAllConfirmedOrders() {
     final result = _dataBaseServices.getStreamCollectionGroup(
      subCollectionId: CollectionPath.instance.userConfirmedOrders,
    );
    return result.map((list) {
      return list.map((e) => OrderModel.fromJson(e)).toList();
    });
  }
  
  @override
  Stream<List<OrderModel>> getAllNotConfirmedOrders() {
   final result = _dataBaseServices.getStreamCollectionGroup(
      subCollectionId: CollectionPath.instance.userNotConfirmedOrders,
    );
    return result.map((list) {
      return list.map((e) => OrderModel.fromJson(e)).toList();
    });
  }
}
