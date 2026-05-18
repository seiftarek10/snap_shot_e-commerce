import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/checkout/domain/use_case/get_user_data_use_case.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_order_use_case.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_payment_use_case.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends BaseCubit<CheckoutState> {
  CheckoutCubit(
    this._makeOrderUseCase,
    this._getUserDataUseCase,
    this._makePaymentUseCase,
  ) : super(const CheckoutInitial());
  final GetUserDataUseCase _getUserDataUseCase;
  final MakeOrderUseCase _makeOrderUseCase;
  final MakePaymentUseCase _makePaymentUseCase;

  double productsCost = 0.0, deliveryCost = 0.0;
  UserEntity? user;
  Future<void> makePayment() async {
    safeEmit(const RequestPaymentSheet());
    String amount = (productsCost + deliveryCost).toString();
    final result = await _makePaymentUseCase.call(
      MakePaymentParam(amount: amount, customerId: user!.customerId),
    );
    if (result is Success<void>) {
      safeEmit(const PaymentComplete());
    } else if (result is AppFailure<void>) {
      safeEmit(PaymentFailed(result.failure.errMessage));
    }
  }

  Future<void> makeOrder({required List<ProductEntity> prodcuts}) async {
    safeEmit(const MakeOrderLoading());
    final userResult = await getUserData();
    if (userResult is! Success<UserEntity>) {
      final failure = (userResult as AppFailure).failure;
      safeEmit(FailedToGetUserData(failure.errMessage));
      return;
    }
    final costs = getCosts(prodcuts);
    OrderEntity order = OrderEntity(
      userData: userResult.data,
      products: prodcuts,
      productsCost: costs.productsCost,
      deliveryCost: costs.deliveryCost,
    );
    final result = await _makeOrderUseCase.call(
      order.copyWith(userData: userResult.data),
    );
    if (result is Success<void>) {
      safeEmit(const MakeOrderSuccess());
    } else if (result is AppFailure<void>) {
      safeEmit(MakeOrderFailure(result.failure.errMessage));
    }
  }

  Future<Result<UserEntity>?> getUserData() async {
    user = null;
    safeEmit(const GettingUserData());
    final userResult = await _getUserDataUseCase.call(null);
    if (userResult is Success<UserEntity>) {
      safeEmit(GetUserDataSuccess(userResult.data));
      user = userResult.data;
      return Success(userResult.data);
    } else if (userResult is AppFailure<UserEntity>) {
      return AppFailure(Failure(userResult.failure.errMessage));
    } else {
      return null;
    }
  }

  ({double productsCost, double deliveryCost}) getCosts(
    List<ProductEntity> products,
  ) {
    for (var e in products) {
      productsCost +=
          double.parse(e.price) * double.parse(e.counter.toString());
    }
    productsCost = double.parse(productsCost.toStringAsFixed(2));
    deliveryCost = double.parse((productsCost * 0.05).toStringAsFixed(2));
    return (productsCost: productsCost, deliveryCost: deliveryCost);
  }
}
