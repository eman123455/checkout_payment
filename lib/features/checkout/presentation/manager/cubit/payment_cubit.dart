import 'package:bloc/bloc.dart';
import 'package:checkout_payment/core/service_locator/service_locator.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/repo/stripe_repo.dart';
import 'package:checkout_payment/features/checkout/data/repo/stripe_repo_implementation.dart';
import 'package:equatable/equatable.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final StripeRepo stripeRepo = getIt<StripeRepoImplementation>();
  Future<void> processPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentProcessing());
    final result = await stripeRepo.processPayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (error) => emit(PaymentFailure(errMag: error.errMsg)),
      (success) => emit(PaymentSuccess()),
    );
  }
}
