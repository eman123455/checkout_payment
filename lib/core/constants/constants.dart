import 'package:checkout_payment/core/constants/images.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final paymentMethods = [Images.cardImagePath, Images.paypalImagePath];
  static const  baseUrl = 'https://api.stripe.com/v1';
  static final secreteKey = dotenv.env['STRIPE_SECRET_KEY']??'';
}
