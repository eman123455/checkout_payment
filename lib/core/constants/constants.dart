import 'package:checkout_payment/core/constants/images.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final paymentMethods = [Images.cardImagePath, Images.paypalImagePath];
  static const baseUrl = 'https://api.stripe.com/v1';
  static final stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static final paypalPublishableKey =
      dotenv.env['PAYPAL_CLIENT_ID'] ?? '';
  static final paypalSecretKey =
      dotenv.env['PAYPAL_SECRET_KEY'] ?? '';
}
