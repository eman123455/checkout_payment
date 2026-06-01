import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/core/constants/constants.dart';
import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/list_items_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/list_items_model/list_items_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thanks_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_methods_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});


  @override
  State<PaymentMethodsBottomSheet> createState() => _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
     bool isPaypalSelected= false;
 void updatePaymentMethodsBottomSheet({required int index}) {
    isPaypalSelected = index == 1 ? true : false;
    setState(() {});

 }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      child: Column(
        mainAxisSize: .min,
        children: [
          PaymentMethodsListView(updatePaymentMethodsBottomSheet: updatePaymentMethodsBottomSheet),
          SizedBox(height: 32.h),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentFailure) {
                context.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errMag)));
              } else if (state is PaymentSuccess) {
                context.push(AppRoutes.kThanksYouView);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is PaymentProcessing ? true : false,
                text: 'Continue',
                onPressed: () {
                  if (isPaypalSelected) {
                    executePaypalPayment(context);
                  } else {
                    executeStripePayment(context);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '5000',
      currency: 'USD',
      customerId: 'cus_UcCLU21nVFh3a8',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).processPayment(paymentIntentInputModel: paymentIntentInputModel);
  }

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

  Map<String, dynamic> getTransactionParams() {
    final amount = AmountModel(
      total: '70',
      currency: 'USD',
      details: Details(subtotal: '70', shipping: '0', shippingDiscount: 0),
    );
    List<OrderItemModel> items = [
      OrderItemModel(name: "Apple", quantity: 4, price: '5', currency: "USD"),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: '10',
        currency: "USD",
      ),
    ];
    final itemsList = ListItemsModel(items: items);
    return {
      "amount": amount.toJson(),
      "description": "The payment transaction description.",
      "item_list": itemsList.toJson(),
    };
  }
}
