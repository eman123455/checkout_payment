import 'package:checkout_payment/features/checkout/presentation/views/checkout_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kCheckoutView='/';
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: kCheckoutView,
        builder: (context,state)=>CheckoutView()
        )
    ]
    );
}
