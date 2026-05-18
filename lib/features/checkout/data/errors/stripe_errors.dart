import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/services.dart';
import 'package:snap_shot/core/errors/failure.dart';


class StripeFailure {
  static Failure handleException(dynamic e) {
    if (e is StripeException) {
      return _handleStripeException(e);
    } else if (e is PlatformException) {
      return _handlePlatformException(e);
    } else {
      return const Failure('An unexpected payment error occurred. Please try again.');
    }
  }

  static Failure _handleStripeException(StripeException e) {
    if (e.error.localizedMessage != null) {
      return Failure(e.error.localizedMessage!);
    }

    switch (e.error.code) {
      case FailureCode.Canceled:
        return const Failure('Payment was canceled.');
      case FailureCode.Failed:
        return const Failure('Payment failed. Please check your card details.');
      case FailureCode.Timeout:
        return const Failure('Payment timed out. Please check your connection.');
      default:
        return Failure(e.error.message ?? 'Stripe payment error occurred.');
    }
  }

  static Failure _handlePlatformException(PlatformException e) {
    return Failure(e.message ?? 'A platform error occurred during payment.');
  }
}
