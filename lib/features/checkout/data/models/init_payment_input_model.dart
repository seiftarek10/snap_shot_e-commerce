class InitPaymentInputModel {
  final String paymentIntentClientSecret;
  final String merchantDisplayName;
  final String customerId;
  final String ephemeralKey;

  InitPaymentInputModel({
    required this.paymentIntentClientSecret,
    required this.merchantDisplayName,
    required this.customerId,
    required this.ephemeralKey,
  });
}
