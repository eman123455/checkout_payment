import 'package:checkout_payment/features/checkout/presentation/views/checkout_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/payment_details_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thanks_you_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kCheckoutView='/CheckoutView';
  static const kMyCartView='/';
  static const kPaymentDetailsView='/PaymentDetailsView';
  static const kThanksYouView='/ThanksYouView';
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: kCheckoutView,
        builder: (context,state)=>CheckoutView()
        ),
      GoRoute(
        path: kMyCartView,
        builder: (context,state)=>MyCartView()
        ),
      GoRoute(
        path: kPaymentDetailsView,
        builder: (context,state)=>PaymentDetailsView()
        ),
      GoRoute(
        path: kThanksYouView,
        builder: (context,state)=>ThanksYouView()
        ),
    ]
    );
}
