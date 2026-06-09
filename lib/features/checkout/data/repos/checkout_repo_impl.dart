import 'dart:developer';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/checkout/data/data_source/remote/checkout_remote_data_source.dart';
import 'package:snap_shot/features/checkout/data/errors/stripe_errors.dart';
import 'package:snap_shot/features/checkout/domain/repos/checkout_repo.dart';
import 'package:snap_shot/features/checkout/domain/use_case/make_payment_use_case.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepoImpl(this._remoteDataSource);
  @override
 
  @override
  Future<Result<void>> makePayment({
    required MakePaymentParam makePaymentParam,
  }) async {
    try {
      await _remoteDataSource.makePayment(
        amount: makePaymentParam.amount,
        customerId: makePaymentParam.customerId,
      );
      return const Success(null);
    } catch (e) {
      if (e is StripeException) {
        log(e.toString());
        return AppFailure(StripeFailure.handleException(e));
      }
      log(e.toString());
      return AppFailure(Failure(e.toString()));
    }
  }
}
