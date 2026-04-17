import 'package:checkout_payment/features/checkout/presentation/views/checkout_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kCheckoutView='CheckoutView';
  static const kMyCartView='/';
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
    ]
    );
}
