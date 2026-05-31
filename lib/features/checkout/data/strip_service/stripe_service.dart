import 'package:checkout_payment/core/constants/constants.dart';
import 'package:checkout_payment/core/utils/services/api_service.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_model/customer_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_model/customer_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;
  StripeService() : apiService = ApiService(baseUrl: Constants.baseUrl);

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      endpoint: '/payment_intents',
      data: paymentIntentInputModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${Constants.secreteKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({String? paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Store',
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future<CustomerModel> createCustomer(
    CustomerInputModel customerInputModel,
  ) async {
    final response = await apiService.post(
      endpoint: '/customers',
      data:customerInputModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${Constants.secreteKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return CustomerModel.fromJson(response.data);
  }
}
