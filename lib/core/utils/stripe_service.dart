import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:snap_shot/features/checkout/data/models/init_payment_input_model.dart';
import 'package:snap_shot/features/checkout/data/models/payment_intent_input_mode.dart';
import 'package:snap_shot/features/checkout/data/models/payment_intent_response_model/payment_intent_response_model.dart';

class StripeService {
  StripeService(this._dio);
  final Dio _dio;
  String stripePath = 'https://api.stripe.com/v1/payment_intents';
  String? token = dotenv.env['STRIPE_SECRET_KEY'];

  Future<PaymentIntentResponseModel> _createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputMode,
  }) async {
    final response = await _dio.post(
      stripePath,
      data: Transformer.urlEncodeMap(paymentIntentInputMode.toJson()),
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return PaymentIntentResponseModel.fromJson(response.data);
  }

  Future<void> _initPaymentSheet({
    required InitPaymentInputModel initPaymentInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentInputModel.paymentIntentClientSecret,
        merchantDisplayName: initPaymentInputModel.merchantDisplayName,
        customerEphemeralKeySecret: initPaymentInputModel.ephemeralKey,
        customerId: initPaymentInputModel.customerId,
      ),
    );
  }

  Future<void> _presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final data = await _createPaymentIntent(
      paymentIntentInputMode: paymentIntentInputModel,
    );
    String ephemeralKey = await _createEhemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    await _initPaymentSheet(
      initPaymentInputModel: InitPaymentInputModel(
        paymentIntentClientSecret: data.clientSecret!,
        merchantDisplayName: 'Seif Tariq',
        ephemeralKey: ephemeralKey,
        customerId: paymentIntentInputModel.customerId,
      ),
    );

    await _presentPaymentSheet();
  }

  Future<String> createCustomerId({required String userName}) async {
    final response = await _dio.post(
      'https://api.stripe.com/v1/customers',
      data: {'name': userName},
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data["id"];
  }

  Future<String> _createEhemeralKey({required String customerId}) async {
    final response = await _dio.post(
      'https://api.stripe.com/v1/ephemeral_keys',
      data: {'customer': customerId},
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Stripe-Version': '2026-04-22.dahlia',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data["secret"];
  }
}
