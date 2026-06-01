import 'package:checkout_payment/core/constants/constants.dart';
import 'package:checkout_payment/core/utils/services/api_service.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_model/customer_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_model/customer_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_session_model/customer_session_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_session_model/customer_session_model.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
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
        'Authorization': 'Bearer ${Constants.stripeSecretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required InitPaymentSheetInputModel inputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: inputModel.paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Store',
        customerId: inputModel.customerId,
        customerSessionClientSecret: inputModel.customerSessionClientSecret,
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

  // save payment method for future use
  Future<CustomerModel> createCustomer(
    CustomerInputModel customerInputModel,
  ) async {
    final response = await apiService.post(
      endpoint: '/customers',
      data: customerInputModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${Constants.stripeSecretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return CustomerModel.fromJson(response.data);
  }

  Future<CustomerSessionModel> createCustomerSession(
    CustomerSessionInputModel customerSessionInputModel,
  ) async {
    final response = await apiService.post(
      endpoint: '/customer_sessions',
      data: customerSessionInputModel.toJson(),
      headers: {
        'Authorization': 'Bearer ${Constants.stripeSecretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return CustomerSessionModel.fromJson(response.data);
  }
}
