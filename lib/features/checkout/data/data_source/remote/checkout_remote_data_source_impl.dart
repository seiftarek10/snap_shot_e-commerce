import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source.dart';
import 'package:snap_shot/features/checkout/data/models/order_model.dart';

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;

  CheckoutRemoteDataSourceImpl(this._remoteDataBaseServices);
  @override
  Future<void> makeOrder({required OrderModel order}) async {
    await _remoteDataBaseServices.addToSubCollection(
      collection: CollectionPath.instance.allOrders,
      parentId: order.userData!.uid,
      subCollection: CollectionPath.instance.userOrders,
      data: order.toJson(),
    );
  }

  @override
  String? getUserId() {
    return _remoteDataBaseServices.getUserId();
  }

  @override
  Future<UserModel?> getUserData() async {
    String? uid = getUserId();
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
