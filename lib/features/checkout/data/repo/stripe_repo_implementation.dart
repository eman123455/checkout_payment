import 'package:checkout_payment/core/errors/failures.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_session_model/customer_session_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_session_model/customer_session_model.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment/features/checkout/data/repo/stripe_repo.dart';
import 'package:checkout_payment/features/checkout/data/strip_service/stripe_service.dart';
import 'package:dartz/dartz.dart';

class StripeRepoImplementation implements StripeRepo {
  final StripeService stripeService;
  StripeRepoImplementation(this.stripeService);

  @override
  Future<Either<Failure, void>> processPayment({
    required PaymentIntentInputModel paymentIntentInputModel, // amount  , currency , customerId
  }) async {
    try {
    //   create payment intent
      PaymentIntentModel paymentIntent = await stripeService
          .createPaymentIntent(paymentIntentInputModel);
    //  create customer session 
      CustomerSessionModel customerSession =
          await stripeService.createCustomerSession(
        CustomerSessionInputModel(
          customerId: paymentIntentInputModel.customerId, 
          
        ),
      );
      InitPaymentSheetInputModel inputModel = InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntent.clientSecret,
        customerId: paymentIntentInputModel.customerId,
        customerSessionClientSecret:
            customerSession.clientSecret,
      );
      await stripeService.initPaymentSheet(
        inputModel: inputModel,
      );
      await stripeService.presentPaymentSheet();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMsg: e.toString()));
    }
  }
}
