import 'package:checkout_payment/core/errors/failures.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class StripeRepo {
  Future<Either<Failure, void>> processPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
