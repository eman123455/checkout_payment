  import 'package:checkout_payment/core/constants/constants.dart';
import 'package:checkout_payment/core/functions/get_transaction_params.dart';
import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thanks_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void executePaypalPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: Constants.paypalPublishableKey,
          secretKey: Constants.paypalSecretKey,
          transactions: [getTransactionParams()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
               MaterialPageRoute(builder: (context) => const ThanksYouView()), 
              (route){
                if(route.settings.name == AppRoutes.kMyCartView){
                  return true;
                }
                return false;
              },
              );
          },
          onError: (error) {
            print("onError: $error");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }