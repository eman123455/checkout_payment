import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/core/functions/execute_paypal_payment.dart';
import 'package:checkout_payment/core/functions/execute_stripe_payment.dart';
import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_methods_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

}
