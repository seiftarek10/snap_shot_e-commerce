import 'package:intl/intl.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/features/checkout/data/models/payment_intent_input_mode.dart';
import 'package:snap_shot/core/utils/stripe_service.dart';

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;
  final StripeService _stripeService;

  CheckoutRemoteDataSourceImpl(
    this._remoteDataBaseServices,
    this._stripeService,
  );
  @override
  Future<void> makeOrder({required OrderModel order}) async {
    await _remoteDataBaseServices.addToSubCollection(
      collection: CollectionPath.instance.allOrders,
      parentId: order.userData!.uid,
      subCollection: CollectionPath.instance.userOrders,
      data: order.toJson(),
    );
    await _incrementOrdersCounter(order.productsCost);
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

  @override
  Future<void> makePayment({
    required String amount,
    required String customerId,
  }) async {
    await _stripeService.makePayment(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: amount,
        currency: 'usd',
        customerId: customerId,
      ),
    );
  }

  @override
  Future<void> deleteProductsCart() async {
    String? uid = getUserId();
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
          'revenue':0
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
}
