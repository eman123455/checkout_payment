import 'package:checkout_payment/core/errors/failures.dart';
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
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      PaymentIntentModel paymentIntent = await stripeService
          .createPaymentIntent(paymentIntentInputModel);
      await stripeService.initPaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret,
      );
      await stripeService.presentPaymentSheet();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMsg: e.toString()));
    }
  }
}
