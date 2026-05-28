import 'package:checkout_payment/features/checkout/data/repo/stripe_repo_implementation.dart';
import 'package:checkout_payment/features/checkout/data/strip_service/stripe_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void startServiceLocator() {
  getIt.registerSingleton(StripeRepoImplementation(StripeService()));
}
