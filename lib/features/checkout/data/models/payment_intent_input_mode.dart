class PaymentIntentInputMode {
  final String amount;
  final String currency;

  PaymentIntentInputMode({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    return {
      'amount': (double.parse(amount.toString()) * 100).round().toString(),
      'currency': currency,
    };
  }
}
