import 'package:checkout_payment/core/components/custom_button.dart';
import 'package:checkout_payment/core/resources/app_routes.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/payment_methods_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      child: Column(
        mainAxisSize: .min,
        children: [
          PaymentMethodsListView(),
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
                  PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                        amount: '5000',
                        currency: 'USD',
                        customerId: 'cus_UcCLU21nVFh3a8',
                      );
                  BlocProvider.of<PaymentCubit>(context).processPayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
