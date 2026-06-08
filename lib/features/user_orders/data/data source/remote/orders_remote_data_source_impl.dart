import 'package:intl/intl.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/user_orders/data/data%20source/remote/orders_remote_data_source.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;

  OrdersRemoteDataSourceImpl(this._remoteDataBaseServices);
  @override
  Future<List<OrderModel>> getUserOrders() async {
    String? uid = _remoteDataBaseServices.getUserId();

    if (uid == null) {
      return [];
    }

    final data = await _remoteDataBaseServices.getSubCollection(
      collection: CollectionPath.instance.notConfirmedOrders,
      parentId: uid,
      subCollection: CollectionPath.instance.userOrders,
    );

    return data.map(((e) => OrderModel.fromJson(e))).toList();
  }



  @override
  Future<void> deleteProductsCart() async {
    String? uid = _remoteDataBaseServices.getUserId();
    if (uid != null) {
      await _remoteDataBaseServices.deleteSubCollection(
        collection: CollectionPath.instance.allCart,
        id: uid,
        subCollection: CollectionPath.instance.userCart,
      );
    }
  }

  Future<void> _incrementOrdersCounter(num revenue) async {
    String collection = CollectionPath.instance.statsData;
    const String docId = '1';

    String currentMonthKey = DateFormat('yyyy-MM-d').format(DateTime.now());

    final Map<String, dynamic> currentData = await _remoteDataBaseServices
        .getById(collection: collection, id: docId);

    if (currentData.isEmpty) {
      await _remoteDataBaseServices.addWithId(
        collection: collection,
        id: docId,
        data: {
          'totalUsers': {
            'total': 1, //
            'monthlyHistory': {currentMonthKey: 1},
          },
          'totalOrders': {'total': 0, 'monthlyHistory': {}},
          'totalProducts': 0,
          'revenue': 0,
        },
      );
      return;
    }

    await _remoteDataBaseServices.incrementField(
      collection: collection,
      fieldKey: 'totalOrders.total',
      value: 1,
    );

    await _remoteDataBaseServices.incrementField(
      collection: collection,
      fieldKey: 'totalOrders.monthlyHistory.$currentMonthKey',
      value: 1,
    );
    await _remoteDataBaseServices.incrementField(
      collection: collection,
      fieldKey: 'revenue',
      value: revenue,
    );
  }

  @override
  Future<void> makeOrder({required OrderModel order}) async {
    await _remoteDataBaseServices.addToSubCollection(
      collection: CollectionPath.instance.notConfirmedOrders,
      parentId: order.userData!.uid,
      subCollection: CollectionPath.instance.userOrders,
      data: order.toJson(),
    );
    await _incrementOrdersCounter(order.productsCost);
  }

  @override
  Future<UserModel?> getUserData() async {
    String? uid = _remoteDataBaseServices.getUserId();
    if (uid != null) {
      final response = await _remoteDataBaseServices.getById(
        collection: CollectionPath.instance.users,
        id: uid,
      );
      return UserModel.fromJson(response);
    } else {
      return null;
    }
  }
}
